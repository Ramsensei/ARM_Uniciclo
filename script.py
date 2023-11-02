from PIL import Image

# Ruta de la imagen de entrada
imagen_entrada = "imagenPrueba.png"

# Abre la imagen
imagen = Image.open(imagen_entrada)

# Obtén los píxeles de la imagen
pixeles = list(imagen.getdata())

# Guarda los píxeles en un archivo de texto
archivo_salida = "pixeles.txt"

with open(archivo_salida, 'w') as archivo:
    for pixel in pixeles:
        archivo.write(f"{pixel}\n")

print(f"Píxeles de la imagen guardados en {archivo_salida}")
