from glob import glob
from PIL import Image
from pathlib import Path

for i in glob("*.png"):
    with Image.open(i) as im:
        im = im.resize((160, 120))
        with open(Path(i).with_suffix(".mem"), "w") as o:
            for pixel in im.getdata():
                r, g, b = pixel[0] >> 4, pixel[1] >> 4, pixel[2] >> 4
                p = (r << 9) + (g << 5) + (b << 1) + (1 if pixel[3] == 255 else 0)
                o.write(f"{format(p, '013b')}\n")
