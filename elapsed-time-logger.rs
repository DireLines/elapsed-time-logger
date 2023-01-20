pub fn elapsed_time_logger(namespace: &str) -> impl FnMut(&str) {
    let namespace = namespace.to_owned();
    let mut start = std::time::Instant::now();
    move |message| {
        let duration = start.elapsed().as_millis();
        println!("{namespace}: {message} took {duration} millis",);
        start = std::time::Instant::now();
    }
}
