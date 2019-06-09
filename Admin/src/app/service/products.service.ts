import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ProductsService {
  server = 'http://localhost:8000'
  adminId = JSON.parse(localStorage.getItem('admin')).adminId

  constructor(
    private http: HttpClient
  ) { }

  createImage(data, product): Observable<any> {
    console.log('DATA: ', data)
    return this.http.post(`${this.server}/products/images?productId=${product}`, data)
  }


  deleteImage(data): Observable<any> {
    return this.http.delete(`${this.server}/products/images?imageId=${data.imageId}&filePath=${data.image}`)
  }

  create(data): Observable<any> {
    return this.http.post(`${this.server}/products/create?adminId=${this.adminId}`, data)
  }

  list(): Observable<any> {
    return this.http.get(`${this.server}/products/list`)
  }

  edit(data) {
    return this.http.put(`${this.server}/products/update/${data.productId}?adminId=${this.adminId}`, data)
  }

  delete(id) {
    return this.http.delete(`${this.server}/products/delete/${id}`)
  }

}
