'use strict';

const express = require('express');
const fetch = require('node-fetch');

async function init() {
  let response = await fetch(
    'http://metadata.google.internal/computeMetadata/v1/instance/name',
    { headers: { 'Metadata-Flavor': 'Google' } },
  );
  if (!response.ok) {
    console.log('failed getting instance name', response);
    return;
  }

  const instName = await response.text();

  response = await fetch(
    'http://metadata.google.internal/computeMetadata/v1/instance/zone',
    { headers: { 'Metadata-Flavor': 'Google' } },
  );
  if (!response.ok) {
    console.log('failed getting instance zone', response);
    return;
  }

  const instZone = await response.text();

  const app = express();
  app.get('/', (req, res) => res.send(`hello from instance ${instName} in zone ${instZone}`));

  await app.listen(process.env.PORT || 8080);

  console.log('started');
}

init().then(null, console.error);
