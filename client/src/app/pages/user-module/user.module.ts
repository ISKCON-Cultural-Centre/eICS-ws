import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';

import { IrkccCustomMaterialModule } from '../../irkcc-custom-material.module';

import { LoginComponent } from './login/login.component';
import { ResetPasswordComponent } from './reset-password/reset-password.component';

@NgModule({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    IrkccCustomMaterialModule
  ],
  declarations: [LoginComponent, ResetPasswordComponent]
})
export class UserModule { }
