use image::*;
use show_image::create_window;
use std::io::BufRead;

#[show_image::main]
fn main() -> Result<(), Box<dyn std::error::Error>> {
    let lines = std::io::BufReader::new(std::io::stdin()).lines();
    let window = create_window("image", Default::default()).unwrap();
    let mut img: RgbImage = ImageBuffer::new(600, 600);
    for line in lines {
        if let Ok(line) = line {
            let pix: Vec<&str> = line.split_ascii_whitespace().collect();
            let fb_addr = pix[0].parse::<u32>().unwrap();
            let hit = pix[1].parse::<u32>().unwrap();
            let bri = pix[2].parse::<u8>().unwrap();
            img.put_pixel(
                fb_addr % 600,
                fb_addr / 600,
                image::Rgb(if hit != 0 {
                    [bri, bri, bri]
                } else {
                    [0, 255, 0]
                }),
            );
        }
    }
    window.set_image("image", img).unwrap();
    loop {}
    #[allow(unreachable_code)]
    Ok(())
}
