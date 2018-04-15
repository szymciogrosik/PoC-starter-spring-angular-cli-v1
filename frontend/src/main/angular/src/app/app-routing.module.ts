import { ModuleWithProviders } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { AuthGuard } from './_guards/auth.guard';

export const appRoutes: Routes = [

  {
    path: 'login',
    component: LoginComponent
  },
  // autoryzacja
  {
    path: 'home',
    component: HomeComponent ,
    canActivate: [AuthGuard]
   },
  // błędne adresy
  {
    path: '**',
    redirectTo: 'login'
  }

];

export const APP_ROUTER_PROVIDERS: ModuleWithProviders = RouterModule.forRoot(appRoutes);
