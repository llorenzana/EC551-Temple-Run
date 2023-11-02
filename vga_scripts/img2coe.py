from PIL import Image

print("memory_initialization_radix=10;")

bram = []
with Image.open("image.png") as im:
    im = im.resize((640, 480))
    for pixel in im.getdata():
        assert pixel[3] == 255
        r, g, b = pixel[0] >> 4, pixel[1] >> 4, pixel[2] >> 4
        p = (r << 8) + (g << 4) + (b << 0)
        bram.append(str(p))

print(f"memory_initialization_vector={','.join(bram)};")
