const express = require("express");
const bodyParser = require("body-parser");
var format = require('date-format');
var mysql = require("mysql");
var path = require('path')

const app = express();


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.set('views',path.join(__dirname,'views'));
app.set('view engine','ejs');

app.use(express.static('assets'));


const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "1101",
  database: "haydauz"
});

db.connect(err => {
  if (err) {
    console.log(err);
  } else {
    console.log("ulandi");
  }
});



app.get("/", (req, res) => {
  res.send('REST API tizimi: <a href = "http://localhost:5000/mijoz" >mijoz</a> -- <a href = "http://localhost:5000/haydovchi" >haydovchi</a> -- <a href = "http://localhost:5000/briktirilgan">briktirilgan</a> -- <a href = "http://localhost:5000/test">test</a>')
});

app.get("/mijoz", (req, res) => {
  db.query("SELECT * FROM mijoz", (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.get("/haydovchi", (req, res) => {
  db.query("SELECT * FROM haydovchi", (err, result) => {
    if (err) throw err;
    res.json(result);
  });
});

app.get("/haydovchiBand", (req, res) => {
  db.query("SELECT * FROM haydovchi WHERE band = '1'", (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.get("/briktirilgan", (req, res) => {
  db.query("SELECT * FROM `mijoz` WHERE briktirildi = '1'", (err, result) => {
    if (err) throw err;
    res.render('zakaz',{
      zakazlar:result
    })
  });
});


app.get("/test", (req, res) => {
  let sql = "SELECT * FROM mijoz WHERE briktirildi = '0' ORDER BY id DESC ";
  db.query(sql,(err,rows)=>{
    // console.log(rows);
    if(err) throw err;
    res.render('mijoz',{
      title:'Test rejimi',
      mijozlar:rows,  
    })
  })
});

app.post("/mijoz", (req, res) => {
  let data = [
    req.body.first_name,
    req.body.last_name,
    req.body.phone,
    req.body.adress,
    // req.body.datatime,
  ]
  let sql = "INSERT INTO `mijoz` (`first_name`, `last_name`, `phone`, `adress`) VALUES (?)"
  db.query(sql,[data], (err,result)=>{
    if (err) throw err; 
    res.redirect('test')
  })
});

app.post('/delete', (req, res) => {
  let sql = "DELETE FROM mijoz WHERE id=" + req.body.id + "";
  db.query(sql, (err, results) => {
      if (err) throw err;
      res.redirect('/test');
  });
});

app.post("/hydas", (req, res) => {
  
  let sql = "SELECT * FROM `haydovchi`WHERE band = '0'";
  db.query(sql, (err, results) => {
    // console.log();
    // console.log(results);
    
    
    // console.log(results);
    //   if (err) throw err;
    //   res.render('mijoz',{
    //     haydas:results,
    //   })
      res.status(200).json(results);
  });
  // console.log(req.body);
});

app.post("/briktir", (req, res) => {
  console.log(req.body);
  let sql = `UPDATE mijoz SET haydovchiId = ${req.body.carId}, briktirildi = '1' WHERE id = ${req.body.id}`
  db.query(sql,function(err,results){
      if (err) throw err;
      res.redirect('/test')
  })
});

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`PORT: ${port}`));
