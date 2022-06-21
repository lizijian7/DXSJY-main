// 加载Express模块
const express = require("express");

// 加载MySQL模块
const mysql = require("mysql");

// 加载bodyParser模块
const bodyParser = require("body-parser");

// 加载MD5模块
const md5 = require("md5");

// 创建MySQL连接池
const pool = mysql.createPool({
  host: "127.0.0.1", //MySQL服务器地址
  port: 3306, //MySQL服务器端口号
  user: "root", //数据库用户的用户名
  password: "", //数据库用户密码
  database: "myemp", //数据库名称
  connectionLimit: 20, //最大连接数
  charset: "utf8", //数据库服务器的编码方式
});

// 创建服务器对象
const server = express();

server.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

// 加载CORS模块
const cors = require("cors");
const { query } = require("express");

// 使用CORS中间件
server.use(
  cors({
    origin: ["http://localhost:8080", "http://127.0.0.1:8080"],
  })
);

// 获取所有文章分类的接口
server.get("/category", (req, res) => {
  // SQL语句以获取文章分类表的数据
  let sql = "SELECT id,category_name FROM xzqa_category ORDER BY id";
  // 执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: "ok", code: 200, results: results });
  });
});

// 获取指定分类下包含文章数据的接口
server.get("/articles", (req, res) => {
  // 获取客户端传递的cid参数
  let cid = req.query.cid;

  // 获取客户端传递的page参数
  let page = req.query.page ? req.query.page : 1;

  // 存储每页显示的记录数
  let pagesize = 20;

  // 通过公式来计算从第几条记录开始返回
  let offset = (page - 1) * pagesize;

  // 用于存储获取到的总记录数
  let rowcount;

  // 获取指定分类下的文章总数
  let sql = "SELECT COUNT(id) AS count FROM xzqa_article WHERE category_id=?";

  pool.query(sql, [cid], (error, results) => {
    if (error) throw error;
    // 将获取到总记录数赋给rowcount变量
    rowcount = results[0].count;
    /**************************************************/
    // 根据总记录数和每页显示的记录数来计算总页数
    let pagecount = Math.ceil(rowcount / pagesize);

    // 查询SQL语句
    sql =
      "SELECT id,subject,description,image FROM xzqa_article WHERE category_id=? LIMIT ?,?";
    // 执行SQL
    pool.query(sql, [cid, offset, pagesize], (error, results) => {
      if (error) throw error;
      res.send({
        message: "ok",
        code: 200,
        results: results,
        pagecount: pagecount,
      });
    });

    /**************************************************/
  });
});

// 获取特定文章数据的接口
server.get("/detail", (req, res) => {
  //获取地址栏中的id参数
  let id = req.query.id;

  // SQL查询
  let sql =
    "SELECT r.id,subject,content,created_at,nickname,avatar,article_number FROM xzqa_article AS r INNER JOIN xzqa_author AS u ON author_id = u.id WHERE r.id=?";

  // 执行SQL查询
  pool.query(sql, [id], (error, results) => {
    if (error) throw error;
    // 返回数据到客户端
    res.send({ message: "ok", code: 200, result: results[0] });
  });
});

//用户注册接口
server.post("/register", (req, res) => {
  //console.log(md5('12345678'));
  // 获取用户名和密码信息
  let empname = req.body.empname;
  let emppwd = req.body.emppwd;
  let phone = req.body.phone;
  //以username为条件进行查找操作，以保证用户名的唯一性
  let sql = "SELECT COUNT(id) AS count FROM myemp WHERE empname=?";
  pool.query(sql, [empname], (error, results) => {
    if (error) throw error;
    let count = results[0].count;
    if (count == 0) {
      // 将用户的相关信息插入到数据表
      sql = "INSERT myemp(empname,emppwd,phone) VALUES(?,?,?)";
      pool.query(sql, [empname, emppwd, phone], (error, results) => {
        if (error) throw error;
        res.send({ message: "ok", code: 200 });
      });
    } else {
      res.send({ message: "user exists", code: 201 });
    }
  });
});

// 用户登录接口
server.post("/login", (req, res) => {
  //获取用户名和密码信息
  let empname = req.body.empname;
  let emppwd = req.body.emppwd;
  // SQL语句
  let sql = "SELECT id,empname,emppwd FROM myemp WHERE empname=? AND emppwd=?";
  pool.query(sql, [empname, emppwd], (error, results) => {
    if (error) throw error;
    if (results.length == 0) {
      //登录失败
      res.send({ message: "login failed", code: 201 });
    } else {
      //登录成功
      res.send({ message: "ok", code: 200, result: results[0] });
    }
  });
});

// 获取数据
server.get("/getdata", (req, res) => {
  pool.query(
    "select id,empname,url from myemp where empname=?",
    [req.query.empname],
    (err, results) => {
      if (err) {
        throw err;
      } else {
        res.send({ code: 200, message: "获取成功", results: results[0] });
      }
    }
  );
});

server.get("/meget", (req, res) => {
  pool.query(
    "select * from myemp where id=?",
    [req.query.id],
    (err, result) => {
      if (err) {
        throw err;
      }
      res.send({ code: 200, message: "获取成功", result: result[0] });
    }
  );
});

//  职q获取数据
server.get("/zqget", (req, res) => {
  // 根据倒序查询所有empzq_zz中的数据
  let page = req.query.page ? req.query.page : 1;
  let pagesize = 4;
  let offset = (page - 1) * pagesize;
  pool.query(
    "select * from empzq_zz order by id desc limit ?,?",
    [offset, pagesize],
    (err, result) => {
      if (err) throw err;
      res.send({ code: 200, msg: "获取成功", result: result });
    }
  );
});

server.get("/index", (req, res) => {
  pool.query("select * from myindex ", (err, result) => {
    if (err) throw err;
    res.send({ code: 200, msg: "获取成功", result: result });
  });
});

server.get("/indexdetail", (req, res) => {
  pool.query(
    "select * from lqfdetail where id=?",
    [req.query.id],
    (err, result) => {
      if (err) throw err;
      res.send({ code: 200, msg: "获取成功", result: result });
    }
  );
});

//  server.post('/empzqinsert',(req,res)=>{
//   pool.query('insert into empzq_zz set?',[req.body],(err,result)=>{
//     if (err) throw err
//     console.log(result);
//     res.send({code:200,msg:'获取成功'})
//   })
//  })

server.post("/empurl", (req, res) => {
  pool.query(
    "update myemp set url=? where id=?",
    [req.body.url, req.body.id],
    (err, result) => {
      if (err) throw err;
      res.send({ code: 200, msg: "修改成功" });
    }
  );
});

server.post("/empzqinsert", (req, res) => {
  pool.query("insert into empzq_zz set?", [req.body], (err, result) => {
    if (err) throw err;
    res.send({ code: 200, msg: "插入成功" });
  });
});

// server.get("/empzqinsertget", (req, res) => {
//   pool.query(
//     "select * from empzq_zz where name=?",
//     [req.query.name],
//     (err, result) => {
//       if (err) throw err;
//       res.send({ code: 200, msg: "查询成功", result: result[0] });
//     }
//   );
// });

server.post("/empdelete", (req, res) => {
  pool.query(
    "delete from empzq_zz where id=?",
    [req.body.id],
    (err, result) => {
      if (err) throw err;
      res.send({ code: 200, msg: "删除成功" });
    }
  );
});

//boss用户注册名测试接口
server.post("/boss_regtextname", (req, res) => {
  //console.log(md5('12345678'));
  // 获取用户名和密码信息
  let username = req.body.username;
  //以username为条件进行查找操作，以保证用户名的唯一性
  let sql = "SELECT  COUNT(id) AS count FROM boss_user WHERE username=?";
  pool.query(sql, [username], (error, results) => {
    if (error) throw error;
    let count = results[0].count;
    if (count == 0) {
      // 将用户的相关信息插入到数据表
      // // sql = 'INSERT boss_user(username,password) VALUES(?,MD5(?))';
      // pool.query(sql, [username, password], (error, results) => {
      //   if (error) throw error;
      res.send({ message: "ok", code: 200 });
      // })
    } else {
      res.send({ message: "user exists", code: 201 });
    }
  });
});
//boss用户注册接口
server.post("/boss_register", (req, res) => {
  //console.log(md5('12345678'));
  // 获取用户名和密码信息
  let username = req.body.username;
  let password = req.body.password;
  let boss_phone = req.body.phone;
  //以username为条件进行查找操作，以保证用户名的唯一性

  // 将用户的相关信息插入到数据表
  sql = "INSERT boss_user(username,password,boss_phone) VALUES(?,MD5(?),?)";
  pool.query(sql, [username, password, boss_phone], (error, results) => {
    if (error) throw error;
    res.send({ message: "ok", code: 200 });
  });
});

// boss用户登录接口
server.post("/boss_login", (req, res) => {
  //获取用户名和密码信息
  let username = req.body.username;
  let password = req.body.password;
  // SQL语句
  let sql =
    "SELECT id,username FROM boss_user WHERE username=? AND password=MD5(?)";
  pool.query(sql, [username, password], (error, results) => {
    if (error) throw error;
    if (results.length == 0) {
      //登录失败
      res.send({ message: "login failed", code: 201 });
    } else {
      //登录成功
      res.send({ message: "ok", code: 200, result: results[0] });
    }
  });
});

// 获取bossjob信息的接口
server.get("/bossjobcard", (req, res) => {
  //获取地址栏中的id参数
  // SQL查询
  let id = req.query.id;

  let sql =
    "SELECT id,jobname,salary,age,jobcontent,welfare,myaddress,work,workyear,education,num FROM boss_user_job ORDER BY id desc";

  // 执行SQL查询
  pool.query(sql, (error, results) => {
    if (error) throw error;
    // 返回数据到客户端
    res.send({ message: "ok", code: 200, result: results });
  });
});

// 删除bossjob信息的接口
server.delete("/bossjobcard", (req, res) => {
  //获取地址栏中的id参数
  // SQL查询
  let id = req.query.id;
  let sql = "delete FROM boss_user_job where id=?";

  // 执行SQL查询
  pool.query(sql, [id], (error, results) => {
    if (error) throw error;
    // 返回数据到客户端
    res.send({ message: "ok", code: 200, result: results });
  });
});
//插入bossjob信息的接口
server.post("/bossjobcard", (req, res) => {
  let jobname = req.body.jobname;
  let salary = req.body.salary;
  let age = req.body.age;
  // let mycompany = req.body.mycompany;
  // let myhr = req.body.myhr;
  let welfare = req.body.welfare;
  let jobcontent = req.body.jobcontent;
  let myaddress = req.body.myaddress;
  let work = req.body.work;
  let workyear = req.body.workyear;
  let education = req.body.education;
  let num = req.body.num;
  // 将用户的相关信息插入到数据表
  sql =
    "INSERT boss_user_job(jobname,salary,age,jobcontent,welfare,myaddress,work,workyear,education,num) VALUES(?,?,?,?,?,?,?,?,?,?)";
  pool.query(
    sql,
    [
      jobname,
      salary,
      age,
      jobcontent,
      welfare,
      myaddress,
      work,
      workyear,
      education,
      num,
    ],
    (error, results) => {
      if (error) throw error;
      res.send({ message: "ok", code: 200 });
    }
  );
});

// 获取所有文章分类的接口
server.get("/bosscategory", (req, res) => {
  // SQL语句以获取文章分类表的数据
  let sql = "SELECT id,category_name FROM boss_category ORDER BY id";
  // 执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: "ok", code: 200, results: results });
  });
});

// 获取指定分类下包含文章数据的接口
server.get("/bossarticles", (req, res) => {
  // 获取客户端传递的cid参数
  let cid = req.query.cid;

  // 获取客户端传递的page参数
  let page = req.query.page ? req.query.page : 1;

  // 存储每页显示的记录数
  let pagesize = 20;

  // 通过公式来计算从第几条记录开始返回
  let offset = (page - 1) * pagesize;

  // 用于存储获取到的总记录数
  let rowcount;

  // 获取指定分类下的文章总数
  let sql = "SELECT COUNT(id) AS count FROM boss_article WHERE category_id=?";

  pool.query(sql, [cid], (error, results) => {
    if (error) throw error;
    // 将获取到总记录数赋给rowcount变量
    rowcount = results[0].count;
    /**************************************************/
    // 根据总记录数和每页显示的记录数来计算总页数
    let pagecount = Math.ceil(rowcount / pagesize);

    // 查询SQL语句
    sql =
      "SELECT id,subject,description,image FROM boss_article WHERE category_id=? LIMIT ?,?";
    // 执行SQL
    pool.query(sql, [cid, offset, pagesize], (error, results) => {
      if (error) throw error;
      res.send({
        message: "ok",
        code: 200,
        results: results,
        pagecount: pagecount,
      });
    });

    /**************************************************/
  });
});

// 获取特定文章数据的接口
server.get("/bossdetail", (req, res) => {
  //获取地址栏中的id参数
  let id = req.query.id;

  // SQL查询
  let sql =
    "SELECT r.id,subject,content,created_at,nickname,avatar,article_number FROM boss_article AS r INNER JOIN boss_article_author AS u ON author_id = u.id WHERE r.id=?";

  // 执行SQL查询
  pool.query(sql, [id], (error, results) => {
    if (error) throw error;
    // 返回数据到客户端
    res.send({ message: "ok", code: 200, result: results[0] });
  });
});

server.get("/empzqinsertget", (req, res) => {
  pool.query(
    "select * from empzq_zz where name=?",
    [req.query.name],
    (err, result) => {
      if (err) throw err;
      res.send({ code: 200, msg: "查询成功", result: result[0] });
    }
  );
});

server.post("/empdelete", (req, res) => {
  pool.query(
    "delete from empzq_zz where id=?",
    [req.body.id],
    (err, result) => {
      if (err) throw err;
      res.send({ code: 200, msg: "删除成功" });
    }
  );
});

server.get("/zqselect", (req, res) => {
  pool.query(
    "select * from empzq_zz where name=?",
    [req.query.name],
    (err, result) => {
      if (err) throw err;
      res.send({ code: 200, msg: "获取成功", result: result });
    }
  );
});

//修改用户投递接口
server.put('/updatesend', (req, res) => {
  console.log(req.body);
  pool.query("select toudi from myemp where id=?", [req.body.uid], (err, result) => {
    if (err) throw err;
    // console.log(result[0].toudi);
    if (result[0].toudi == 0) {
      let arr = []
      arr.push(req.body.cid)
      // console.log(arr);
      let str = arr.toString()
      pool.query("update myemp set toudi=? where id=?", [str, req.body.uid], (err, result) => {
        if (err) throw err;
        res.send({ code: 200, msg: "ok" })
      })
    } else {
      let arr = result[0].toudi.split(',')
      arr.push(req.body.cid)
      let str = arr.toString()
      pool.query("update myemp set toudi=? where id=?", [str, req.body.uid], (err, result) => {
        if (err) throw err;
        res.send({ code: 200, msg: "ok" })
      })
    }
  })
})
//投递列表接口
server.get('/sendlist', (req, res) => {
  pool.query('select toudi from myemp where id=?', [req.query.uid], (err, result) => {
    if (err) throw err;
    let arr = result[0].toudi.split(',')
    console.log(arr)
    let list = []
    for (key in arr) {
      pool.query(`select * from myindex where id=${arr[key]}`, (err, result) => {
        if (err) throw err;
        list.push(result[0])
        // console.log(result[0])
      })
    }
    console.log(list)
  })
})
// 指定服务器对象监听的端口号
server.listen(3000, () => {
  console.log("server is running...");
});
