'use strict';

const express = require('express');
const fetch = require('node-fetch');

async function init() {
  let response = await fetch('http://metadata.google.internal/computeMetadata/v1/instance/name', { headers: { 'Metadata-Flavor': 'Google' } });
  if (!response.ok) {
    console.log('failed getting instance name', response);
    return;
  }

  const instName = await response.text();
}
