from PIL import Image

def guardar_pixeles_en_txt(imagen_path, txt_path):
    # Abrir la imagen
    imagen = Image.open(imagen_path)

    # Convertir la imagen a escala de grises
    imagen_gris = imagen.convert('L')

    # Obtener los valores de los píxeles en escala de grises
    pixeles_grises = list(imagen_gris.getdata())

    # Obtener el ancho y alto de la imagen
    ancho, alto = imagen_gris.size

    # Crear o abrir un archivo de texto para escribir los valores de los píxeles
    with open(txt_path, 'w') as archivo_txt:
        # Escribir el ancho, alto y número de píxeles en la primera línea
        archivo_txt.write(f"{ancho}\n{alto}\n{len(pixeles_grises)}\n")

        # Escribir los valores de los píxeles en líneas separadas
        for pixel in pixeles_grises:
            archivo_txt.write(f"{pixel}\n")

# Ejemplo de uso
imagen_path = 'imagenPrueba.png'  # Reemplaza con la ruta de tu imagen
txt_path = 'pixeles_en_gris.txt'  # Reemplaza con el nombre que desees para el archivo de texto

guardar_pixeles_en_txt(imagen_path, txt_path)


