use crate::common::*;
use crate::quaternion::*;
use crate::ray::*;
use crate::triangle::*;

pub fn render(
    object: &Vec<Triangle>,
    transform: Quaternion,
    camera: Ray,
    direction: Ray,
    light: Ray,
) -> (bool, u8) {
    let (mut f0, mut t0, mut a0) = (false, Num::from_num(0.0), Num::from_num(0.0));
    let mut brightness = 0;
    for triangle in object {
        let triangle = Triangle {
            points: [
                transform.rotate(triangle.points[0]),
                transform.rotate(triangle.points[1]),
                transform.rotate(triangle.points[2]),
            ],
            normal: transform.rotate(triangle.normal),
        };
        let (f, t, a) = triangle.intersect(camera, direction);
        if !f0 || (f && t * a0 < t0 * a) {
            f0 = f;
            t0 = t;
            a0 = a;
            let reflected =
                light - triangle.normal * light.dot(triangle.normal) * Num::from_num(2.0);
            brightness = ((reflected.dot(direction) + Num::from_num(1.0)).to_num() * 127.5) as u8;
        }
    }
    (f0, brightness)
}
