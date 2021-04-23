import axios from 'axios';

const http = axios.create({baseURL: 'https://localhost:44381'});

export default{
    saveGame(payload) {
        console.log(payload);
        //return http.post('/game', payload);
        http
    }
}