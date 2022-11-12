/*jshint esversion: 6 */

const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
const cors = require('cors')({origin: true});
const mysql = require('mysql');

admin.initializeApp();
let transporter = nodemailer.createTransport({
host: 'smtp.hostinger.com',
auth: {
        secure: true,
        user: 'team@bitengos.com',
        pass: '******'
    }
});
exports.sendMail = functions.https.onRequest((req, res) => {
    const email = req.query.email;
    const name = req.query.name;
    const subject = req.query.subject;
    const description = req.query.desc;
    const con = mysql.createConnection({
        host: "35.192.41.8",
        origin: "35.192.41.8",
        user: "test_user",
        database: "bitengos_site_db",
        password: "Test2022"
    });

    con.connect(function(err) {
        if (err) throw err;
        console.log("Successfully Connected with DB");
        const insertQuery = `INSERT INTO bitengos_site_db.sent_email_table (name,email,subject,description) VALUES ('${name}','${email}','${subject}','${description}')`;
        con.query(insertQuery, (error, result, fields) => {
            // if(error) throw error.message; 
            // return res.send(`result: OK`);
            // return res.send(`email IS ${result[0].title}`);
            // response.redirect('https://musical-venture-opinion-itcm.firebaseapp.com/thanks.html');
        });
    });
    
    cors(req, res, () => {
        const mailOptions = 
        {
            from: 'team@bitengos.com',
            to: 'team@bitengos.com',
            subject: 'נשלח מאתר Bitengos',
            html: `<h3>נושה הפניה: ${subject}</h3>
            <h4>שם: ${name}</h4>
            דוא"ל: ${email}
            <p>תיאור: ${description}</p>`
        };

        return transporter.sendMail(mailOptions, (erro, info) => {
            if(erro){return res.send(erro.toString());}
            return res.send(`result: OK`);
        });
    });

});