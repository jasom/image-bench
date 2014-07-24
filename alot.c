#include <sys/types.h>
#include <sys/wait.h>

#include <unistd.h>
int main(int argc, char *argv[])
{
    int i;
    int iter=atoi(argv[1]);
    for(i=0;i<iter;++i) {
        pid_t pid=fork();
        if(pid) {
            waitpid(pid,NULL,0);
        }
        else {
            execl(argv[2],argv[2],NULL);
        }
    }
    return 0;
}
