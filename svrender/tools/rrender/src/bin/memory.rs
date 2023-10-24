use rrender::common::*;
use rrender::ray::*;
use rrender::triangle::*;

fn main() {
    let file = std::fs::File::open("item.obj").unwrap();
    let raw: obj::Obj<obj::Position> = obj::load_obj(std::io::BufReader::new(file)).unwrap();
    const SCALE: f64 = 1.0;
    for idx in raw.indices.chunks_exact(3) {
        let t = FTriangle::new([
            FRay {
                x: raw.vertices[idx[0] as usize].position[0] as f64 / SCALE,
                y: raw.vertices[idx[0] as usize].position[1] as f64 / SCALE,
                z: raw.vertices[idx[0] as usize].position[2] as f64 / SCALE,
            },
            FRay {
                x: raw.vertices[idx[1] as usize].position[0] as f64 / SCALE,
                y: raw.vertices[idx[1] as usize].position[1] as f64 / SCALE,
                z: raw.vertices[idx[1] as usize].position[2] as f64 / SCALE,
            },
            FRay {
                x: raw.vertices[idx[2] as usize].position[0] as f64 / SCALE,
                y: raw.vertices[idx[2] as usize].position[1] as f64 / SCALE,
                z: raw.vertices[idx[2] as usize].position[2] as f64 / SCALE,
            },
        ]);
        println!(
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
            Num::from_num(t.normal.z as f32).print()
        );
    }
}
