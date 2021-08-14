#include<bits/stdc++.h>
#include<cstdio>
#include<stdio.h>

using namespace std;

int main(int argc, char** argv)
{
	char *name = argv[0];
	char *path = argv[1];

	FILE *file;
	if((file = fopen("in.txt","r"))!=NULL)
	{
		 char *command = (char*)calloc(sizeof(char)*100);
		 command = "st -T \"floating\" -e sh -c \"g++" ;
		 strcat(command,path);
		 strcat(command," -o ");
		 strcat(command,name);
		 strcat(command,"&& ./%< ; read -n1 > out.txt\"");
	}
	else
	{
		 char *command = (char*)calloc(sizeof(char)*100);
		 command = "st -T \"floating\" -e sh -c \"g++" ;
		 strcat(command,path);
		 strcat(command," -o ");
		 strcat(command,name);
		 strcat(command,"&& ./%< > out.txt; read -n1 \"");
	return 0;
}
