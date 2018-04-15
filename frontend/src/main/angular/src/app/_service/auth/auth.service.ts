import { Injectable } from '@angular/core';
import { tokenNotExpired, AuthHttp, AuthConfig } from 'angular2-jwt';
import { Cookie } from 'ng2-cookies/ng2-cookies';
import { Http, RequestOptions } from '@angular/http';
import { Router } from '@angular/router';
import { AppProperties } from '../../app-properties';
import 'rxjs/add/operator/map';

@Injectable()
export class AuthService {
  public token: string;
  public username: string;

  constructor(public http: AuthHttp,
              public router: Router) {
    if (this.isLoggedIn()) {
      this.token = Cookie.get(AppProperties.TOKEN_NAME);
      this.username = Cookie.get(AppProperties.CURRENT_USER);
    }
  }

  doLogin(loginData: string) {
    return this.http.post(AppProperties.BACK_SERVER + '/auth', loginData)
      .map(res => {
        const data = res.json();
        if (data) {
          localStorage.setItem(AppProperties.TOKEN_NAME, data.token);
          localStorage.setItem(AppProperties.CURRENT_USER, data.username);
          this.token=data.token;
          this.username=data.username;
          Cookie.set(AppProperties.TOKEN_NAME, data.token);
          Cookie.set(AppProperties.CURRENT_USER, data.username);
          return true;
        } else return false;
      });
  }

  doLogout() {
    localStorage.removeItem(AppProperties.TOKEN_NAME);
    localStorage.removeItem(AppProperties.CURRENT_USER);
    this.token = null;
    this.username = null;
    Cookie.delete(AppProperties.TOKEN_NAME);
    Cookie.delete(AppProperties.CURRENT_USER);
    this.router.navigate(['/login']);
  }

  isLoggedIn() {
    return tokenNotExpired(AppProperties.TOKEN_NAME, Cookie.get(AppProperties.TOKEN_NAME));
  }

  static getAuthHttp(http: Http, options: RequestOptions) {
    return new AuthHttp(new AuthConfig({
      noJwtError: true,
      headerPrefix: AppProperties.AUTH_HEADER_PREFIX,
      globalHeaders: [{'Accept': 'application/json'}],
      tokenGetter: (() => sessionStorage.getItem(AppProperties.TOKEN_NAME)),
    }), http, options);
  }

}
