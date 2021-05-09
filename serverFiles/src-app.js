import express from 'express';

import cookieParser from 'cookie-parser';

import logger from 'morgan';

import indexRouter from './routes/index';

// import path from require('path');
// import createError from 'http-errors';

const app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use('/v1', indexRouter);

module.exports = app;