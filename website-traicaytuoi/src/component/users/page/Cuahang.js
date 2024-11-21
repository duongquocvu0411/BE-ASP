import React, { useContext, useEffect, useState } from "react";
import Footerusers from "../Footerusers";
import axios from "axios";
import HeaderUsers from "../HeaderUsers";
import { CartContext } from "./CartContext";
import { Link } from "react-router-dom";
import { toast, ToastContainer } from "react-toastify";
import { Spinner } from "react-bootstrap";
import Countdown from "react-countdown";

const Cuahang = () => {
  const [danhMuc, setDanhMuc] = useState([]);
  const [sanPham, setSanPham] = useState([]);
  const [danhMucDuocChon, setDanhMucDuocChon] = useState("");
  const { addToCart } = useContext(CartContext);
  const [dangtai, setDangtai] = useState(false);
  const [trangHienTai, setTrangHienTai] = useState(1);
  const [dangXemSanPhamSale, setDangXemSanPhamSale] = useState(false); // Trạng thái xem sản phẩm sale hay không sale
  const sanPhamMoiTrang = 8;

  useEffect(() => {
    fetchDanhMuc();
    fetchSanPham(); // Lấy sản phẩm mặc định
  }, [danhMucDuocChon, dangXemSanPhamSale]);

  const fetchDanhMuc = async () => {
    try {
      const response = await axios.get(`${process.env.REACT_APP_BASEURL}/api/danhmucsanpham`);
      setDanhMuc(response.data);
    } catch (error) {
      console.error("Error fetching categories:", error);
    }
  };

  const fetchSanPham = async () => {
    setDangtai(true);
    try {
      const baseUrl = dangXemSanPhamSale
        ? `${process.env.REACT_APP_BASEURL}/api/Sanpham/spcosale`
        : `${process.env.REACT_APP_BASEURL}/api/Sanpham/spkhongsale`;

      const url = danhMucDuocChon
        ? `${baseUrl}/danhmuc-${dangXemSanPhamSale ? "sale" : "khongsale"}/${danhMucDuocChon}`
        : baseUrl;

      const response = await axios.get(url);

      if (Array.isArray(response.data)) {
        setSanPham(response.data);
      } else {
        setSanPham([]);
      }
    } catch (error) {
      console.error("Error fetching products:", error);
      setSanPham([]);
    } finally {
      setDangtai(false);
    }
  };

  const indexOfLastProduct = trangHienTai * sanPhamMoiTrang;
  const indexOfFirstProduct = indexOfLastProduct - sanPhamMoiTrang;
  const sanPhamHienTai = sanPham.slice(indexOfFirstProduct, indexOfLastProduct);
  const tongSoTrang = Math.ceil(sanPham.length / sanPhamMoiTrang);
  const thayDoiTrang = (soTrang) => setTrangHienTai(soTrang);

  return (
    <div>
      <HeaderUsers />
      <div className="container-fluid page-header py-5">
        <h1 className="text-center text-white display-6">Cửa hàng</h1>
      </div>
      <div className="container-fluid fruite py-5">
        <div className="container py-5">
          <h1 className="mb-4">Cửa hàng trái cây tươi</h1>

          {/* Filter Buttons */}
          <div className="d-flex justify-content-start mb-4">
            <button
              className={`btn ${!dangXemSanPhamSale ? "btn-primary" : "btn-light"} me-3`}
              onClick={() => {
                setTrangHienTai(1);
                setDangXemSanPhamSale(false);
              }}
            >
              Sản phẩm không sale
            </button>
            <button
              className={`btn ${dangXemSanPhamSale ? "btn-primary" : "btn-light"}`}
              onClick={() => {
                setTrangHienTai(1);
                setDangXemSanPhamSale(true);
              }}
            >
              Sản phẩm sale
            </button>
          </div>

          {/* Category Dropdown */}
          <div className="d-flex justify-content-end mb-4">
            <div className="bg-light ps-3 py-3 rounded d-flex align-items-center">
              <div className="dropdown">
                <button
                  className="btn btn-secondary dropdown-toggle"
                  type="button"
                  id="dropdownCategoryButton"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  {danhMucDuocChon
                    ? danhMuc.find((dm) => dm.id === danhMucDuocChon)?.name || "Danh mục không rõ"
                    : "Tất cả sản phẩm"}
                </button>
                <ul className="dropdown-menu" aria-labelledby="dropdownCategoryButton">
                  <li>
                    <button className="dropdown-item" type="button" onClick={() => setDanhMucDuocChon("")}>
                      Tất cả sản phẩm
                    </button>
                  </li>
                  {danhMuc.map((dm) => (
                    <li key={dm.id}>
                      <button className="dropdown-item" type="button" onClick={() => setDanhMucDuocChon(dm.id)}>
                        {dm.name}
                      </button>
                    </li>
                  ))}
                </ul>
              </div>
            </div>
          </div>

          <div className="tab-content mt-4">
            <div className="tab-pane fade show p-0 active">
              {dangtai ? (
                <div className="text-center">
                  <Spinner animation="border" variant="primary" />
                  <p>Đang tải dữ liệu...</p>
                </div>
              ) : sanPham.length > 0 ? (
                <div className="row g-4">
                  {sanPhamHienTai.map((sanPham) => {
                    const activeSale = sanPham.sanphamSales?.find(
                      (sale) =>
                        sale.trangthai === "Đang áp dụng" &&
                        new Date(sale.thoigianbatdau) <= new Date() &&
                        new Date(sale.thoigianketthuc) >= new Date()
                    );

                    return (
                      <div className="col-md-6 col-lg-4 col-xl-3" key={sanPham.id}>
                        <div className="rounded position-relative fruite-item shadow-sm">
                          <div className="fruite-img position-relative">
                            <Link to={`/sanpham/${sanPham.id}`} className="btn btn-link">
                              <img
                                src={sanPham.hinhanh}
                                className="img-fluid w-100 rounded-top"
                                alt={sanPham.tieude}
                                style={{ height: 250, objectFit: "cover" }}
                              />
                            </Link>
                          </div>
                          <div className="p-3 rounded-bottom">
                            <p className="h5 fw-bold">{sanPham.tieude}</p>
                            <div className="d-flex flex-column align-items-start">
                              {activeSale ? (
                                <>
                                  <p className="text-muted mb-1" style={{ textDecoration: "line-through" }}>
                                    {parseFloat(sanPham.giatien).toLocaleString("vi-VN", { minimumFractionDigits: 3 })}{" "}
                                    vnđ / {sanPham.don_vi_tinh}
                                  </p>
                                  <p className="text-danger fw-bold mb-2">
                                    {parseFloat(activeSale.giasale).toLocaleString("vi-VN", { minimumFractionDigits: 3 })}{" "}
                                    vnđ / {sanPham.don_vi_tinh}
                                  </p>
                                  <p className="text-warning mb-2">
                                    <Countdown
                                      date={new Date(activeSale.thoigianketthuc)}
                                      renderer={({ days, hours, minutes, seconds, completed }) =>
                                        completed ? (
                                          <span>Khuyến mãi đã kết thúc</span>
                                        ) : (
                                          <span>
                                            Còn lại: {days} ngày {hours} giờ {minutes} phút {seconds} giây
                                          </span>
                                        )
                                      }
                                    />
                                  </p>
                                </>
                              ) : (
                                <p className="text-dark fs-5 fst-italic mb-0">
                                  {parseFloat(sanPham.giatien).toLocaleString("vi-VN", { minimumFractionDigits: 3 })}{" "}
                                  vnđ / {sanPham.don_vi_tinh}
                                </p>
                              )}
                            </div>
                            <button
                              onClick={() => addToCart(sanPham)}
                              className="btn btn-warning w-100 mt-3"
                            >
                              Thêm vào giỏ
                            </button>
                          </div>
                        </div>
                      </div>
                    );
                  })}
                </div>
              ) : (
                <div className="text-center">
                  <p>
                    {dangXemSanPhamSale
                      ? "Không có sản phẩm sale nào."
                      : "Không có sản phẩm nào trong danh mục này."}
                  </p>
                </div>
              )}
            </div>
          </div>

          {/* Pagination */}
          <div className="d-flex justify-content-center mt-4">
            <ul className="pagination">
              <li className="page-item" onClick={() => thayDoiTrang(trangHienTai - 1)}>
                <button className="page-link" disabled={trangHienTai === 1}>
                  Previous
                </button>
              </li>
              {[...Array(tongSoTrang)].map((_, index) => (
                <li key={index} className="page-item" onClick={() => thayDoiTrang(index + 1)}>
                  <button className="page-link">{index + 1}</button>
                </li>
              ))}
              <li className="page-item" onClick={() => thayDoiTrang(trangHienTai + 1)}>
                <button className="page-link" disabled={trangHienTai === tongSoTrang}>
                  Next
                </button>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <Footerusers />
      <ToastContainer />
    </div>
  );
};

export default Cuahang;
