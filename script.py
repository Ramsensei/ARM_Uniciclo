from PIL import Image

def image_to_grayscale_mif(image_path, output_path):
    # Abre la imagen
    image = Image.open(image_path)
    
    # Convierte la imagen a escala de grises
    grayscale_image = image.convert("L")
    
    # Obtiene las dimensiones de la imagen
    width, height = grayscale_image.size
    
    # Abre el archivo MIF para escritura
    with open(output_path, "w") as mif_file:
        # Escribe el ancho y alto de la imagen
        mif_file.write(f"WIDTH = 32;\n")
        mif_file.write(f"DEPTH = 65536;\n")
        mif_file.write(f"ADDRESS_RADIX = UNS;\n")
        mif_file.write(f"DATA_RADIX = UNS;\n")
        mif_file.write(f"CONTENT BEGIN\n")
        
        # Itera sobre cada píxel y escribe su valor en el archivo MIF
        for address in range(0, width * height):
            x = address % width
            y = address // width
            pixel_value = grayscale_image.getpixel((x, y))
            mif_file.write(f"\t{address+address*3:d} : {pixel_value:03d};\n")
        
        mif_file.write(f"END;\n")

# Ejemplo de uso
image_to_grayscale_mif("img1.png", "memRam.mif")









