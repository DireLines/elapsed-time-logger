import time
def elapsedTimeLogger(namespace:str):
    start_this_stage=time.time()
    prefix = namespace+": "
    def logElapsedTime(message):
        nonlocal start_this_stage
        now = time.time()
        elapsed = now - start_this_stage
        start_this_stage = now
        print(f"{prefix}{message} took {elapsed} s")
    return logElapsedTime