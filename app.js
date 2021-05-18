const Koa = require('koa')
const app = new Koa()
const views = require('koa-views')
const json = require('koa-json')
const onerror = require('koa-onerror')
const bodyparser = require('koa-bodyparser')
const logger = require('koa-logger')
const static = require('koa-static'); 
const koaBody = require('koa-body');
const path = require("path");
const index = require('./routes/index')
const users = require('./routes/users')
// const cors = require('koa2-cors');
//适配vue history的中间件
const {historyApiFallback} = require('koa2-connect-history-api-fallback');

// error handler
onerror(app)


//配置跨域
// app.use(cors());

// handle fallback for HTML5 history API
app.use(historyApiFallback()); 
// middlewares
app.use(bodyparser({
  enableTypes:['json', 'form', 'text']
}))
app.use(json())
app.use(logger())
app.use(require('koa-static')(__dirname + '/public/dist'))
app.use(views(__dirname + '/views', {
  extension: 'pug'
}))


// logger
app.use(async (ctx, next) => {
  const start = new Date()
  await next()
  const ms = new Date() - start
  console.log(`${ctx.method} ${ctx.url} - ${ms}ms`)
})

// routes
app.use(index.routes(), index.allowedMethods())
app.use(users.routes(), users.allowedMethods())

// error-handling
app.on('error', (err, ctx) => {
  console.error('server error', err, ctx)
});

//配置静态文件路由
app.use(static("./public/"));

app.use(koaBody({
  multipart:true, // 支持文件上传
  // encoding:'gzip',
  formidable:{
    uploadDir:path.join(__dirname,'public/uploads/'), // 设置文件上传目录
    keepExtensions: true,    // 保持文件的后缀
    maxFieldsSize:2 * 1024 * 1024, // 文件上传大小
    onFileBegin:(name,file) => { // 文件上传前的设置
      // console.log(`name: ${name}`);
      // console.log(file);
    },
  }
}));
module.exports = app
