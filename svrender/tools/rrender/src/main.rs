use image::*;
use rrender::common::*;
use rrender::quaternion::*;
use rrender::ray::*;
use rrender::render::*;
use rrender::triangle::*;
use show_image::{create_window, event};

#[show_image::main]
fn main() -> Result<(), Box<dyn std::error::Error>> {
    let file = std::fs::File::open("item.obj").unwrap();
    let raw: obj::Obj<obj::Position> = obj::load_obj(std::io::BufReader::new(file)).unwrap();
    let mut object: Vec<Triangle> = vec![];
    const SCALE: f32 = 1.0;
    for idx in raw.indices.chunks_exact(3) {
        object.push(Triangle::new([
            Ray {
                x: Num::from_num(raw.vertices[idx[0] as usize].position[0] / SCALE),
                y: Num::from_num(raw.vertices[idx[0] as usize].position[1] / SCALE),
                z: Num::from_num(raw.vertices[idx[0] as usize].position[2] / SCALE),
            },
            Ray {
                x: Num::from_num(raw.vertices[idx[1] as usize].position[0] / SCALE),
                y: Num::from_num(raw.vertices[idx[1] as usize].position[1] / SCALE),
                z: Num::from_num(raw.vertices[idx[1] as usize].position[2] / SCALE),
            },
            Ray {
                x: Num::from_num(raw.vertices[idx[2] as usize].position[0] / SCALE),
                y: Num::from_num(raw.vertices[idx[2] as usize].position[1] / SCALE),
                z: Num::from_num(raw.vertices[idx[2] as usize].position[2] / SCALE),
            },
        ]));
    }

    let window = create_window("image", Default::default()).unwrap();

    let k: u16 = 600;
    let m: u16 = 600;
    let camera = Ray {
        x: Num::from_num(0.0),
        y: Num::from_num(0.0),
        z: Num::from_num(4.0),
    };
    let light = Ray {
        x: Num::from_num(0.0),
        y: Num::from_num(-1.0),
        z: Num::from_num(0.0),
    };
    let dx = Num::from_num(1.0 / k as f32);
    let dy = Num::from_num(1.0 / m as f32);
    let mut rotation = Quaternion::unit();

    for event in window.event_channel()? {
        if let event::WindowEvent::KeyboardInput(event) = event {
            if event.input.state.is_pressed() {
                match event.input.key_code {
                    Some(event::VirtualKeyCode::W) => {
                        rotation = Quaternion::dx() * rotation;
                    }
                    Some(event::VirtualKeyCode::D) => {
                        rotation = Quaternion::dy() * rotation;
                    }
                    Some(event::VirtualKeyCode::A) => {
                        rotation = Quaternion::dy().rev() * rotation;
                    }
                    Some(event::VirtualKeyCode::S) => {
                        rotation = Quaternion::dx().rev() * rotation;
                    }
                    _ => {
                        continue;
                    }
                }
            } else {
                continue;
            }
        } else {
            continue;
        }
        let mut img: RgbImage = ImageBuffer::new(k.into(), m.into());
        for x in 1..k {
            for y in 1..m {
                let target = Ray {
                    x: dx * x - dy * (k / 2),
                    y: dy * y - dy * (m / 2),
                    z: Num::from_num(3.0),
                };
                let (visible, brightness) =
                    render(&object, rotation, camera, target - camera, light);
                img.put_pixel(
                    (x - 1).into(),
                    (y - 1).into(),
                    image::Rgb(if visible {
                        [brightness, brightness, brightness]
                    } else {
                        [0, 255, 0]
                    }),
                );
            }
        }
        if window.set_image("image", img).is_err() {
            return Ok(());
        }
        println!("rendered {:?}", rotation);
    }
    Ok(())
}
