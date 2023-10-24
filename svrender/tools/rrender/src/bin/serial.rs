use rrender::common::*;
use rrender::ray::*;
use rrender::triangle::*;
use serial::prelude::*;
use serial::*;
use std::io::Write;

fn main() {
    let mut ser = serial::open("/dev/ttyUSB0").unwrap();
    ser.configure(&PortSettings {
        baud_rate: Baud115200,
        char_size: Bits8,
        parity: ParityNone,
        stop_bits: Stop1,
        flow_control: FlowNone,
    })
    .unwrap();
    let file = std::fs::File::open(&std::env::args().collect::<Vec<String>>()[1]).unwrap();
    let raw: obj::Obj<obj::Position> = obj::load_obj(std::io::BufReader::new(file)).unwrap();
    ser.write(
        &hex::decode(format!(
            "02020202020202020202020202020202020202020202020202020202"
        ))
        .unwrap(),
    )
    .unwrap();
    let mut max: f64 = 0.0;
    for v in &raw.vertices {
        max += v.position[0].abs() as f64;
        max += v.position[1].abs() as f64;
        max += v.position[2].abs() as f64;
    }
    max = max * 2.0 / (raw.vertices.len() * 3) as f64;
    for idx in raw.indices.chunks_exact(3) {
        let t = FTriangle::new([
            FRay {
                x: raw.vertices[idx[0] as usize].position[0] as f64 / max,
                y: raw.vertices[idx[0] as usize].position[1] as f64 / -max,
                z: raw.vertices[idx[0] as usize].position[2] as f64 / max,
            },
            FRay {
                x: raw.vertices[idx[1] as usize].position[0] as f64 / max,
                y: raw.vertices[idx[1] as usize].position[1] as f64 / -max,
                z: raw.vertices[idx[1] as usize].position[2] as f64 / max,
            },
            FRay {
                x: raw.vertices[idx[2] as usize].position[0] as f64 / max,
                y: raw.vertices[idx[2] as usize].position[1] as f64 / -max,
                z: raw.vertices[idx[2] as usize].position[2] as f64 / max,
            },
        ]);
        ser.write(
            &hex::decode(format!(
                "01{}",
                format!(
                    "{}{}{}{}{}{}{}{}{}{}{}{}",
                    Num::from_num(t.points[0].x as f32).print(),
                    Num::from_num(t.points[0].y as f32).print(),
                    Num::from_num(t.points[0].z as f32).print(),
                    Num::from_num(t.points[1].x as f32).print(),
                    Num::from_num(t.points[1].y as f32).print(),
                    Num::from_num(t.points[1].z as f32).print(),
                    Num::from_num(t.points[2].x as f32).print(),
                    Num::from_num(t.points[2].y as f32).print(),
                    Num::from_num(t.points[2].z as f32).print(),
                    Num::from_num(t.normal.x as f32).print(),
                    Num::from_num(t.normal.y as f32).print(),
                    Num::from_num(t.normal.z as f32).print(),
                )
                .chars()
                .collect::<Vec<char>>()
                .chunks(8)
                .map(|c| format!(
                    "{:02x}",
                    u32::from_str_radix(&c.iter().collect::<String>(), 2).unwrap()
                ))
                .rev()
                .collect::<String>()
            ))
            .unwrap(),
        )
        .unwrap();
    }
}
