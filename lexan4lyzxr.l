%{
    /*
   @archkr0w
    */


    #include <stdio.h>
    #include <string.h>
    #include <ctype.h>

    int num_of_int = 0;    //contador de enteros
    int num_of_chars = 0;  //contador de caracteres
    int num_of_lines = 0;  //contador de líneas

    //funcion que encripta los caracteres y numeros
    void cambiar_numero_letra(const char *num, int len);
%}

%%

[ \t]+         {   /* reemplaza dos o mas espacios por uno */
                    int len = yyleng;
                    for (int i = 0; i < len; i++) {
                        if (yytext[i] == ' ' || yytext[i] == '\t') {
                            printf("%c", yytext[i]);
                            cambiar_numero_letra(&yytext[i], 1);
                        }
                    }
                }
                
[#][^\n]*\n    ;   //elimina la línea de comentario que comienza con #
;              {printf("\n"); cambiar_numero_letra(";", 1);}   //reemplaza el ; con un salto de línea
ñ              {printf("n"); cambiar_numero_letra("ñ", 1);}    //reemplaza la ñ por n

[a-zA-Z]+      {printf("%s", yytext); cambiar_numero_letra(yytext, yyleng);}   //busca y encripta strings

[0-9]+         {printf("%s", yytext); num_of_int++; cambiar_numero_letra(yytext, yyleng);} //reconoce números enteros

.|\n           {printf("%s", yytext); cambiar_numero_letra(yytext, yyleng);}  //maneja cualquier otro carácter y cuenta líneas

%%

int main(int argc, char* argv[])
{
    if (argc == 1)    
    {
        yylex();
        printf("\n\nNúmero de caracteres: %d\n", num_of_chars);
        printf("Número de líneas: %d\n", num_of_lines);
        printf("Número de enteros: %d\n", num_of_int);
    }
    else
    {
        fprintf(stderr, "Uso: %s\n", argv[0]);
        return 1;
    }

    return 0;
}

void cambiar_numero_letra(const char *num, int len)
{
    FILE *archivo;    
    int i;
    archivo = fopen("texto_encriptado.txt", "a");   
    if (archivo == NULL)
    {
        fprintf(stderr, "No se pudo abrir el archivo para encriptar.\n");
        return;
    }
    for(i = 0; i < len; i++)
    {
        num_of_chars++; //contamos cada caracter
        if(num[i] == '\n')
            num_of_lines++; //contamos líneas
        
        if(num[i] == ',')
            fprintf(archivo, "%c", num[i]);
        else if(num[i] == 'a' || num[i] == 'A') 
            fprintf(archivo, "C");
        else if(num[i] == 'b' || num[i] == 'B')
            fprintf(archivo, "I");
        else if(num[i] == 'c' || num[i] == 'C')
            fprintf(archivo, "S");
        else if(num[i] == 'd' || num[i] == 'D')
            fprintf(archivo, "Q");
        else if(num[i] == 'e' || num[i] == 'E')
            fprintf(archivo, "V");
        else if(num[i] == 'f' || num[i] == 'F')
            fprintf(archivo, "N");
        else if(num[i] == 'g' || num[i] == 'G')
            fprintf(archivo, "F");
        else if(num[i] == 'h' || num[i] == 'H')
            fprintf(archivo, "O");
        else if(num[i] == 'i' || num[i] == 'I')
            fprintf(archivo, "W");
        else if(num[i] == 'j' || num[i] == 'J')
            fprintf(archivo, "A");
        else if(num[i] == 'k' || num[i] == 'K')
            fprintf(archivo, "X");
        else if(num[i] == 'l' || num[i] == 'L')
            fprintf(archivo, "M");
        else if(num[i] == 'm' || num[i] == 'M')
            fprintf(archivo, "T");
        else if(num[i] == 'n' || num[i] == 'N')
            fprintf(archivo, "G");
        else if(num[i] == 'o' || num[i] == 'O')
            fprintf(archivo, "U");
        else if(num[i] == 'p' || num[i] == 'P')
            fprintf(archivo, "H");
        else if(num[i] == 'q' || num[i] == 'Q')
            fprintf(archivo, "P");
        else if(num[i] == 'r' || num[i] == 'R')
            fprintf(archivo, "B");
        else if(num[i] == 's' || num[i] == 'S')
            fprintf(archivo, "K");
        else if(num[i] == 't' || num[i] == 'T')
            fprintf(archivo, "L");
        else if(num[i] == 'u' || num[i] == 'U')
            fprintf(archivo, "R");
        else if(num[i] == 'v' || num[i] == 'V')
            fprintf(archivo, "E");
        else if(num[i] == 'w' || num[i] == 'W')
            fprintf(archivo, "Y");
        else if(num[i] == 'x' || num[i] == 'X')
            fprintf(archivo, "D");
        else if(num[i] == 'y' || num[i] == 'Y')
            fprintf(archivo, "Z");
        else if(num[i] == 'z' || num[i] == 'Z')
            fprintf(archivo, "J");

        /*****************************************************************/

        else if(num[i] == '0')        
            fprintf(archivo, "5");
        else if(num[i] == '1')
            fprintf(archivo, "4");
        else if(num[i] == '2')
            fprintf(archivo, "7");
        else if(num[i] == '3')
            fprintf(archivo, "2");
        else if(num[i] == '4')
            fprintf(archivo, "9");
        else if(num[i] == '5')
            fprintf(archivo, "1");
        else if(num[i] == '6')
            fprintf(archivo, "3");
        else if(num[i] == '7')
            fprintf(archivo, "0");
        else if(num[i] == '8')
            fprintf(archivo, "6");
        else if(num[i] == '9')
            fprintf(archivo, "8");
        else
            fprintf(archivo, "%c", num[i]);
    }
    fclose(archivo);
}
