const elapsedTimeLogger = (namespace) => {
  let startTimeThisStage = Date.now();
  const prefix = namespace ? `${namespace}: ` : "";
  return (message) => {
    const now = Date.now();
    const elapsed = now - startTimeThisStage;
    startTimeThisStage = now;
    console.log(`${prefix}${message} took ${elapsed} ms`);
  };
};
