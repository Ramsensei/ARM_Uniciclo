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
    num_pixeles = len(pixeles_grises)

    # Crear o abrir un archivo de texto para escribir los valores de los píxeles
    with open(txt_path, 'w') as archivo_txt:
        archivo_txt.write(f"WIDTH=32;\nDEPTH=32768;\nADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\nCONTENT BEGIN\n")
        archivo_txt.write(f"\t0      :   {ancho};\n")
        archivo_txt.write(f"\t4      :   {alto};\n")
        archivo_txt.write(f"\t8      :   {num_pixeles};\n")

        # Escribir los valores de los píxeles de 4 en 4 en el formato especificado
        for i in range(0, num_pixeles, 4):
            archivo_txt.write(f"\t{i//4 * 16 + 12}      :   {pixeles_grises[i]};\n")
            archivo_txt.write(f"\t{i//4 * 16 + 16}      :   {pixeles_grises[i+1]};\n")
            archivo_txt.write(f"\t{i//4 * 16 + 20}      :   {pixeles_grises[i+2]};\n")
            archivo_txt.write(f"\t{i//4 * 16 + 24}      :   {pixeles_grises[i+3]};\n")

        archivo_txt.write("END;")

# Ejemplo de uso
imagen_path = 'img1.png'  # Reemplaza con la ruta de tu imagen
txt_path = 'memRam.mif'  # Reemplaza con el nombre que desees para el archivo de texto

guardar_pixeles_en_txt(imagen_path, txt_path)






