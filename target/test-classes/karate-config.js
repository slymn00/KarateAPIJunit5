function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'https://reqres.in/api'
  }
  return config;
}