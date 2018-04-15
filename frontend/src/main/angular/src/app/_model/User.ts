import {Role} from './Role';
export interface User {
  username: string;
  firstname: string;
  lastname: string;
  email: string;
  role: Role[];
}
