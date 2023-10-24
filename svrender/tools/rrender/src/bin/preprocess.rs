use rrender::common::*;
use rrender::ray::*;
use rrender::triangle::*;

fn main() {
    let file = std::fs::File::open("item.obj").unwrap();
    let raw: obj::Obj<obj::Position> = obj::load_obj(std::io::BufReader::new(file)).unwrap();
    const SCALE: f32 = -50.0;
    for idx in raw.indices.chunks_exact(3) {
        let t = Triangle::new([
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
        ]);
        println!(
            "{} {} {} {} {} {} {} {} {} {} {} {}",
            t.points[0].x.to_num(),
            t.points[0].y.to_num(),
            t.points[0].z.to_num(),
            t.points[1].x.to_num(),
            t.points[1].y.to_num(),
            t.points[1].z.to_num(),
            t.points[2].x.to_num(),
            t.points[2].y.to_num(),
            t.points[2].z.to_num(),
            t.normal.x.to_num(),
            t.normal.y.to_num(),
            t.normal.z.to_num()
        );
    }
}
