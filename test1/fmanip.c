#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

//test lire après avoir écrit
int test_fmanip()
{
    FILE *fpt;
    char *mess1="Hello";
    char *mess2=malloc(sizeof(char)*strlen(mess1));

    //test ouvrir et écrire
    printf("test ouvrir et écrire\n");    
    if((fpt=fopen("toto.txt","w"))==NULL)
    {
        perror("Erreur de l'ouverture dans l'écriture");
        exit(EXIT_FAILURE);
    }
    printf("ecrit: %s\n",mess1);
    fwrite(mess1,strlen(mess1),1,fpt);
    fclose(fpt);
    printf("succes!!!\n");
    
    //test ouvrir et lire
    printf("test ouvrir et lire\n"); 
    if((fpt=fopen("toto.txt","r"))==NULL)
    {
        perror("Erreur de l'ouverture dans le lecture");
        exit(EXIT_FAILURE); 
    }        
    fread(mess2,strlen(mess1),1,fpt);
    fclose(fpt);
    printf("lu: %s\n",mess2);

    //test contenu
    printf("contenu écrit et lu\n");
    if(strcmp(mess1,mess2)==0)
    {
        printf("Bon ecrit et lu \n");
    }
    else
    {
        perror("erreur ecrire et lire!!!");
        exit(EXIT_FAILURE);
    }
    
    //test append
    printf("test append\n"); 
    if((fpt=fopen("toto.txt","a"))==NULL)
    {
        perror("Erreur de l'ouverture dans l'écriture à la fin");
        exit(EXIT_FAILURE);
    }
    int i=5;
    printf("ecrit %d fois de %s\n",i,mess1);
    for(i=0;i<5;i++)
    {
        fwrite(mess1,strlen(mess1),1,fpt);
    }
    printf("succes!!!\n");
    fclose(fpt);
    printf("cat toto.txt\n");
    printf("\n");
    
    //test fseek, ftell
    fpt=fopen("toto.txt","r");
    fseek(fpt,0,SEEK_SET);
    printf("Au debut du fichier (%d)\n",ftell(fpt));
    fseek(fpt,0,SEEK_END);
    printf("A la fin du fichier (%d)\n %d",ftell(fpt));
    fclose(fpt);
    
    return 0;
}


int main(int argc, char* argv[])
{
    test_fmanip();
    return 0;
}
