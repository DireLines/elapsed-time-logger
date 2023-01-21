using System;

public static Action<string> elapsedTimeLogger(string logname) {
    var watch = new System.Diagnostics.Stopwatch();
    watch.Start();
    return (message) => {
        watch.Stop();
        var elapsed = watch.ElapsedMilliseconds;
        Console.WriteLine(String.Format("{0}: {1} took {2} millis",logname,message,elapsed));
        watch.Restart();
    };
}