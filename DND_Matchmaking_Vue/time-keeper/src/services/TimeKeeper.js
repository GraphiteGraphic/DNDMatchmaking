import axios from 'axios';

const http = axios.create({baseURL: 'https://localhost:44381'});

export default{
    saveTime(payload) {
        console.log(payload);
//        return http.put()
    },
    getFactions() {
        return http.get('/faction');
    },
    getRaces() {
        return http.get('/race');
    },
    getSubraces() {
        return http.get('/subrace');
    },
    getOrigins() {
        return http.get('/origin');
    },
    getSuborigins() {
        return http.get('/suborigin');
    },
    getDeities() {
        return http.get('/deity');
    },
}