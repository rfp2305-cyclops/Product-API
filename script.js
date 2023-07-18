import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
  http.get('https://localhost:3000/products/1');
  sleep(1);
}
