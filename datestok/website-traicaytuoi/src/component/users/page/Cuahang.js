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
  const [sanPhamSale, setSanPhamSale] = useState([]);
  const [danhMucDuocChon, setDanhMucDuocChon] = useState("");
  const { addToCart } = useContext(CartContext);
  const [dangtai, setDangtai] = useState(false);
  const [trangHienTai, setTrangHienTai] = useState(1);
  const [dangXemSanPhamSale, setDangXemSanPhamSale] = useState(false); // Trạng thái xem sản phẩm sale hay không sale
  const sanPhamMoiTrang = 8;

  useEffect(() => {
    fetchDanhMuc();
    if (!dangXemSanPhamSale) {
      laySanPham(); // Lấy sản phẩm mặc định
    } else {
      laySanPhamSale(); // Lấy sản phẩm sale khi đang xem sản phẩm sale
    }
  }, [danhMucDuocChon, dangXemSanPhamSale, trangHienTai]);

  const fetchDanhMuc = async () => {
    try {
      const response = await axios.get(`${process.env.REACT_APP_BASEURL}/api/danhmucsanpham`);
      setDanhMuc(response.data);
    } catch (error) {
      console.error("Error fetching categories:", error);
    }
  };

  const laySanPham = async () => {
    setDangtai(true);
    try {
      const url = danhMucDuocChon
        ? `${process.env.REACT_APP_BASEURL}/api/Sanpham/danhmuc-khongsale/${danhMucDuocChon}`
        : `${process.env.REACT_APP_BASEURL}/api/Sanpham/spkhongsale`;
      const response = await axios.get(url);

      if (response.data.length === 0) {
        setSanPham([]); // Đặt danh sách sản phẩm thành mảng rỗng
      } else {
        setSanPham(response.data || []);
      }
    } catch (error) {
      console.error('Lỗi khi lấy sản phẩm thông thường:', error);
      setSanPham([]); // Nếu có lỗi, đặt danh sách sản phẩm thành mảng rỗng
    } finally {
      setDangtai(false);
    }
  };

  const laySanPhamSale = async () => {
    setDangtai(true);
    try {
      const response = await axios.get(`${process.env.REACT_APP_BASEURL}/api/Sanpham/spcosale`);
      setSanPhamSale(response.data || []);
    } catch (error) {
      console.error('Lỗi khi lấy sản phẩm khuyến mãi:', error);
      toast.error('Không thể tải sản phẩm khuyến mãi!', { position: 'top-right', autoClose: 3000 });
    } finally {
      setDangtai(false);
    }
  };

  // Tính toán các chỉ số phân trang
  const indexOfLastProduct = trangHienTai * sanPhamMoiTrang;
  const indexOfFirstProduct = indexOfLastProduct - sanPhamMoiTrang;
  const sanPhamHienTai = dangXemSanPhamSale ? sanPhamSale : sanPham;

  // Phân trang cho sản phẩm không sale
  const sanPhamHienTaiTrang = sanPhamHienTai.slice(indexOfFirstProduct, indexOfLastProduct);
  const tongSoTrang = Math.ceil(sanPhamHienTai.length / sanPhamMoiTrang);

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
              ) : sanPhamHienTaiTrang.length > 0 ? (
                <div className="row g-4">
                  {sanPhamHienTaiTrang.map((sanPham) => {
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
                                src={sanPham.hinhanh || "/path/to/default-image.jpg"}
                                className="img-fluid w-100 rounded-top"
                                alt={sanPham.tieude || "Sản phẩm không có tiêu đề"}
                                style={{ height: 250, objectFit: "cover" }}
                              />
                            </Link> 
                            <div>
                            {sanPham.trangthai === "Hết hàng" && (
                              <div
                                className="position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center bg-dark bg-opacity-50"
                                style={{ zIndex: 1, padding: "5px 10px", borderRadius: "5px" }}
                              >
                                <span className="text-white small fw-bold">Hết hàng</span>
                              </div>
                            )}
                          </div>
                            <div
                            className="text-white bg-secondary px-2 py-1 rounded position-absolute"
                            style={{ top: 10, left: 10 }}
                          >
                            {sanPham.danhmucsanphamName || "Danh mục không rõ"}
                          </div>
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
                                      date={new Date(activeSale.thoigianketthuc).getTime()}
                                      renderer={({ hours, minutes, seconds }) => (
                                        <span className="fw-bold">
                                          Còn lại: {hours}h {minutes}m {seconds}s
                                        </span>
                                      )}
                                    />
                                  </p>
                                </>
                              ) : (
                                <p className="text-danger fw-bold">
                                  {parseFloat(sanPham.giatien).toLocaleString("vi-VN", { minimumFractionDigits: 3 })} vnđ /{" "}
                                  {sanPham.don_vi_tinh}
                                </p>
                              )}
                            </div>
                            <div className="d-flex justify-content-between mt-2">
                            {sanPham.trangthai !== "Hết hàng" && (
                                <button
                                  onClick={() => addToCart(sanPham)}
                                  className="btn border border-secondary rounded-pill px-3 text-primary"
                                >
                                  <i className="fa fa-shopping-bag me-2 text-primary" />
                                  Thêm vào giỏ
                                </button>
                              )}
                              <Link to={`/sanpham/${sanPham.id}`} className="btn btn-link">
                                Chi tiết
                              </Link>
                            </div>
                          </div>
                        </div>
                      </div>
                    );
                  })}
                </div>
              ) : (
                <div className="text-center">
                  <p className="h5">Không có sản phẩm nào.</p>
                </div>
              )}
            </div>
          </div>

          {/* Pagination */}
          <div className="pagination justify-content-center mt-5">
            <nav aria-label="Page navigation">
              <ul className="pagination">
                <li className="page-item">
                  <button
                    className="page-link"
                    onClick={() => thayDoiTrang(trangHienTai - 1)}
                    disabled={trangHienTai === 1}
                  >
                    Trước
                  </button>
                </li>
                {[...Array(tongSoTrang).keys()].map((index) => (
                  <li
                    className={`page-item ${trangHienTai === index + 1 ? "active" : ""}`}
                    key={index}
                  >
                    <button className="page-link" onClick={() => thayDoiTrang(index + 1)}>
                      {index + 1}
                    </button>
                  </li>
                ))}
                <li className="page-item">
                  <button
                    className="page-link"
                    onClick={() => thayDoiTrang(trangHienTai + 1)}
                    disabled={trangHienTai === tongSoTrang}
                  >
                    Sau
                  </button>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Cuahang;
