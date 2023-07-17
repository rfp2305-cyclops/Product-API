//practice test
const http = require('k6/http');
const { check, sleep } = require('k6');

//smoke test
/*
export const options = {
  vus: 3, // Key for Smoke test. Keep it at 2, 3, max 5 VUs
  duration: '1m', // This can be shorter or just a few iterations
};

export default () => {
  const urlRes = http.req('https://localhost:3000/products/1');
  sleep(1);
}; */

// load test
/*
export const options = {
  // Key configurations for avg load test in this section
  stages: [
    { duration: '5m', target: 100 }, // traffic ramp-up from 1 to 100 users over 5 minutes.
    { duration: '30m', target: 100 }, // stay at 100 users for 10 minutes
    { duration: '5m', target: 0 }, // ramp-down to 0 users
  ],
};

export default () => {
  const urlRes = http.req('https://localhost:3000/products/103');
  sleep(1);
}; */

//stress test

export const options = {
  // Key configurations for Stress in this section
  stages: [
    { duration: '10m', target: 200 }, // traffic ramp-up from 1 to a higher 200 users over 10 minutes.
    { duration: '30m', target: 200 }, // stay at higher 200 users for 10 minutes
    { duration: '5m', target: 0 }, // ramp-down to 0 users
  ],
};

export default () => {
  const urlRes = http.req('https://localhost:3000/products/103');
  sleep(1);
};