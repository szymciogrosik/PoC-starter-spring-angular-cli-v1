import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import {Http, HttpModule } from '@angular/http';
import { APP_ROUTER_PROVIDERS } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { AuthService } from './_service/auth/auth.service';
import { CookieService } from 'angular2-cookie/core';
import { AuthHttp } from 'angular2-jwt/angular2-jwt';
import { AuthGuard } from './_guards/auth.guard';
import { HeaderComponent } from './header/header.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    HeaderComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    APP_ROUTER_PROVIDERS
  ],
  providers: [
    AuthHttp,
    {
      provide: AuthHttp,
      useFactory: AuthService.getAuthHttp,
      deps: [Http]
    },
    AuthGuard,
    AuthService,
    CookieService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
