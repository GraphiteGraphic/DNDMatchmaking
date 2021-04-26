import axios from 'axios';

const discord = axios.create({
    baseURL: 'https://discord.com/api/'
});

export default {
    discord_token(code) {  

        const params = new URLSearchParams();
        params.append('client_id', process.env.VUE_APP_CLIENTID);
        params.append('client_secret', process.env.VUE_APP_CLIENTSECRET);
        params.append('code', code);
        params.append('grant_type', 'authorization_code');
        params.append('redirect_uri', `http://localhost:8080`);
        params.append('scope', 'identify');
        
        const config = { headers: {'Content-Type': 'application/x-www-form-urlencoded'}}

        return discord.post('oauth2/token', params , config);
    },
    discord_user(token) {

        return discord.get('users/@me', {
            headers: {
                authorization: `${token.token_type} ${token.access_token}`
            }
        })
    }
}