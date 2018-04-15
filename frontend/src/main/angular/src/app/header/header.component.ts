import { Component, OnInit } from '@angular/core';
import { AuthService } from "../_service/auth/auth.service";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  constructor(private authService: AuthService) { }

  ngOnInit() {
  }

  doLogout() {
    this.authService.doLogout();
  }

}
