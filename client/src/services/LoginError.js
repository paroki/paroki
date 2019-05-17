export default class LoginError extends Error {
    constructor(error, json){
        super('Gagal login');
        this.message = this.getMessage(json.message);
        return this;
    }

    getMessage(message){
        let translated = null;
        switch (message.message) {
            case 'bad_credentials':
                translated = 'Username atau password anda salah, periksa lagi data yang anda masukkan';
                break;
        }
        return translated;
    }
}
