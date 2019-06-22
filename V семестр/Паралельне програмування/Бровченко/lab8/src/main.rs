use std::thread;
use rulinalg::matrix::Matrix;
use rand::Rng;



fn f1(size: usize) -> Matrix<f64> {
    let mut rng = rand::thread_rng();

    let e: f64 = rng.gen();
    let mut a_vec: Vec<f64> = Vec::new();
    let mut b_vec: Vec<f64> = Vec::new();
    let mut ma_vec: Vec<f64> = Vec::new();
    let mut mc_vec: Vec<f64> = Vec::new();

    for _ in 0..size {
        a_vec.push(rng.gen());
        b_vec.push(rng.gen());
        for _ in 0..size {
            ma_vec.push(rng.gen());
            mc_vec.push(rng.gen());
        }
    }
    let a = Matrix::new(1, size, a_vec);
    let b = Matrix::new(1, size, b_vec);
    let ma = Matrix::new(size, size, ma_vec);
    let mc = Matrix::new(size, size, mc_vec);
    // println!("A = \n{},\nB = \n{},\nMA = \n{},\nMC = \n{},\ne = {}", a, b, ma, mc, e);
    // println!("F1 = {}", result);
    a - (b * (ma * mc) * e)
}


fn f2(size: usize) -> Matrix<f64> {
    let mut rng = rand::thread_rng();

    let k: f64 = rng.gen();
    let mut mf_vec: Vec<f64> = Vec::new();
    let mut mg_vec: Vec<f64> = Vec::new();

    for _ in 0..size {
        for _ in 0..size {
            mf_vec.push(rng.gen());
            mg_vec.push(rng.gen());
        }
    }
    let mf = Matrix::new(size, size, mf_vec);
    let mg = Matrix::new(size, size, mg_vec);
    // println!("MF = \n{},\nMG = \n{},\nk = {}", mf, mg, k);
    // println!("F2 = {}", result);
    mf * mg * k
}


fn f3(size: usize) -> Matrix<f64> {
    let mut rng = rand::thread_rng();

    let mut p: Vec<f64> = Vec::new();
    let mut mr_vec: Vec<f64> = Vec::new();
    let mut mt_vec: Vec<f64> = Vec::new();

    for _ in 0..size {
        p.push(rng.gen());
        for _ in 0..size {
            mr_vec.push(rng.gen());
            mt_vec.push(rng.gen());
        }
    }
    let mr = Matrix::new(size, size, mr_vec);
    let mt = Matrix::new(size, size, mt_vec);
    p.sort_by(|a, b| a.partial_cmp(b).unwrap());
    let mp = Matrix::new(1, size, p);
    mp * (mr * mt)
}



fn main() {
    let size: usize = 500;
    let s1 = size.clone();
    let s2 = size.clone();
    let s3 = size.clone();

    let handle1 = thread::spawn(move || {
        println!("Start F1");
        f1(s1);
        println!("End F1");
    });

    let handle2 = thread::spawn(move || {
        println!("Start F2");
        f2(s2);
        println!("End F2");
    });

    let handle3 = thread::spawn(move || {
        println!("Start F3");
        f3(s3);
        println!("End F3");
    });

    handle1.join().unwrap();
    handle2.join().unwrap();
    handle3.join().unwrap();
}
