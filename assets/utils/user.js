import jwt from 'jsonwebtoken';

export default class User {
    constructor(){
        this.authenticated = false;
        this.roles = [];
        this.expiredAt = null;
    }

    resetToken(){
        this.token = localStorage.getItem('token');
        if(this.token !== null){
            const credentials = jwt.decode(this.token);
            this.authenticated = true;
            this.roles = credentials.roles;
            this.expiredAt = credentials.exp;
        }
    }

    hasRole(roleName){
        return !!this.roles.indexOf(roleName);
    }
}
