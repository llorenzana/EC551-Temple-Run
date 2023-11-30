from PIL import Image

with Image.open("../artwork/tree.png") as im:
    im = im.resize((160, 120))
    for pixel in im.getdata():
        r, g, b = pixel[0] >> 4, pixel[1] >> 4, pixel[2] >> 4
        p = (r << 9) + (g << 5) + (b << 1) + (1 if pixel[3] == 255 else 0)
        print(format(p, '013b'))
