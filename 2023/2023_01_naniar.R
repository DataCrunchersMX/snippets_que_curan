## 
## Data Crunchers - Snippets que curan 
## Lidiando con diferentes valores para missing values con {naniar}
## 

### Paquetes ----
# install.packages("pacman") Ejecuta esta línea si aún no instalas el paquete {pacman}
pacman::p_load(naniar, tidyverse)

### Generar base de datos ----
foo <- tibble(var_1 = letters[1:6], 
              var_2 = c(23, "N/A", 21, "Valor faltante", ".", 24), 
              var_3 = c("Valor faltante", 34, 31, "N/A", -99, 35), 
              var_4 = c(2.5, 3.4, ".", 2.2, 3, -99))

# Por favor nota que al crear foo usamos cuatro valores diferentes para representar los valores faltantes: "N/A", "Valor faltante", "." y -99. 

# Echemos un ojito a foo
foo 

### Reemplazar valores utilizando naniar::replace_with_na_all() ----

## En dos pasos ----

# Construir vector con valores que corresponden a valores faltantes
valores_na <- c(-99, ".", "Valor faltante", "N/A")

# Reemplazar valores por NAs
foo %>% 
  replace_with_na_all(condition = ~ .x %in% valores_na)


## En un solo paso ----

# Reemplazar valores por NAs
foo %>% 
  replace_with_na_all(condition = ~ .x %in% c(-99, ".", "Valor faltante", "N/A"))
