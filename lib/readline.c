/*
   Copyright 2023 Rafael Ferreira de Castilho Silva

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

#include <stdlib.h>
#include "readline.h"

char *readline(FILE *file)
{
    char *str = malloc(sizeof(char));
    size_t strsize = 0;
    const size_t buffersize = 8; // update this valuere later

    if (str == NULL)
    {
        return str;
    }

    strsize = getline(&str, &buffersize, file);

    if (strsize == -1)
    {
        free(str);
        str = NULL;
        return str;
    }
    str[strsize - 1] = '\0';

    char *tmp = realloc(str, strsize);
    if (tmp == NULL)
    {
        free(str);
        str = NULL;
        return str;
    }
    str = tmp;
    strsize--;
    tmp = NULL;
    return str;
};