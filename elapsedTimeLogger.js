const elapsedTimeLogger = (prefix) => {
  let startTimeThisStage = Date.now();
  const prefix = prefix ? `${prefix}: ` : "";
  return (message) => {
    const now = Date.now();
    const elapsed = now - startTimeThisStage;
    startTimeThisStage = now;
    console.log(`${prefix}${message} took ${elapsed} ms`);
  };
};
