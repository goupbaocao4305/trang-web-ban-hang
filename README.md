# MÔN PHÁT TRIỂN PHẦN MỀM NGUỒN MỞ (4305)

#Tên đề tài : xây dựng trang web bán hàng


                
Ngành công nghệ thông tin (CNTT) trong những năm gần đây đã có những bước phát triển vượt bậc trên thế giới cũng như trong nước. CNTT đã góp phần rất lớn cho sự phát triển kinh tế của nước ta trong thời kỳ đổi mới. Chính vì thế nhu cầu tin học hóa các chương trình quản lý hàng hóa cũng đang rất cần thiết để có thể đổi mới với quy định quản lý, đạt hiệu quả cao. 
Ứng dụng tin học trong công tác quản lý đã phát triển mạnh mẽ giúp cho công tác quản lý ngày càng trở nên hiệu quả hơn như nâng cao hiệu suất trong công việc, đưa ra các báo cáo, các số liệu thống kê một cách nhanh chóng chính xác và kịp thời. Đồng thời nhờ có việc ứng dụng tin học đã tiết kiệm được rất nhiều thời gian, công sức của con người, nó làm giảm nhẹ bộ máy quản lý vốn rất cồng kềnh từ trước tới nay


## Tác giả

* **Thái Quốc Anh** - Tác giả  https://github.com/quocanhcd778899
* **Trần Quốc Nam** - Đồng tác giả  https://github.com/namnt96
* **Huỳnh Quốc Cương** - Đồng tác giả https://github.com/cuonghuynh191



# xây dựng trang web bán hàng
                

Ngành công nghệ thông tin (CNTT) trong những năm gần đây đã có những bước phát triển vượt bậc trên thế giới cũng như trong nước. CNTT đã góp phần rất lớn cho sự phát triển kinh tế của nước ta trong thời kỳ đổi mới. Chính vì thế nhu cầu tin học hóa các chương trình quản lý bán hàng cũng đang rất cần thiết để có thể đổi mới với quy định quản lý, đạt hiệu quả cao. 




## Kiến thức áp dụng
* Sử dụng các control cơ bản và nâng cao trong Webform. 
* DataGridView, DataSet, DataTable, DataRow.
* Phân tích thiết kế hệ thống cơ sở dữ liệu.
* Phân tích thiết kế giao diện.
* Trigger SQL.
* Procedure, function SQL.
* Kết nối SQL server với ứng dụng winform.
* Chuyển data giữa các form.
* Phân quyền người dùng trên ứng dụng.
* DataBiding cơ bản và nâng cao.
* Thêm, xóa, sửa dữ liệu từ trang quản trị.


## Triển khai



## Nền tảng xây dựng

*  Nền tảng hệ thống phần mềm
Công nghệ .NET được dùng để xây dựng các ứng dụng Web là ASP.NET, nó cung cấp hai vùng tên khá mạnh và đầy đủ phục vụ cho việc tạo các ứng dụng Web là System.Webvà System.Web.UI. Trong phần này chúng ta sẽ tập trung chủ yếu vào việc dùng ngôn ngữ C# để lập trình với ASP.NET.

Bộ công cụ Web Form cũng được thiết kế để hỗ trợ mô hình phát triển nhanh (RAD). Với Web Form, ta có thể kéo thả các điều khiển trên Form thiết kế cũng như có thể viết mã trực tiếp trong tập tin .aspxhay .aspx.cs. Ứng dụng Web sẽ được triển khai trên máy chủ, còn người dùng sẽ tương tác với ứng dụng thông qua trình duyệt. .NET còn hỗ trợ ta bộ cung cụ để tạo ra các ứng dụng tuân theo mô hình n - lớp (tầng - n tier), giúp ta có thể quản lý được ứng dụng được dễ dàng hơn và nhờ thế nâng cao hiệu suất phát triển phần mềm.

eb Form là bộ công cụ cho phép thực thi các ứng dụng mà các trang Web do nó tạo động ra được phân phối đến trình duyệt thông qua mạng Internet.

Với Web Forms, ta tạo ra các trang HTML với nội dung tĩnh và dùng mã C# chạy trên Server để xử lý dữ liệu tĩnh này rồi tạo ra trang Web động, gửi trang này về trình duyệt dưới mã HTML chuẩn.

Web Forms được thiết để chạy trên bất kỳ trình duyệt nào, trang HTML gửi về sẽ được gọt giũa sao cho thích hợp với phiên bản của trình duyệt. Ngoài dùng C#, ta cũng có thể dùng ngôn ngữ VB.NET để tạo ra các ứng dụng Web tương tự.

Web Forms chia giao diện người dùng thành hai phần : phần thấy trực quan ( hay UI) và phần trang mã phía sau của UI. Quan điểm này thì tương tự với Windows Form, nhưng với Web Forms, hai phần này nằm trên hai tập tin riêng biệt. Phần giao diện UI được lưu trữ trong tập tin có phần mở rộng là .aspx, còn mã được lưu trữ trong tập tin có phần mở rộng là .aspx.cs.

SQL Server là một hệ quản lý cơ sở dữ liệu quan hệ được phát triển bởi Microsoft . Là một máy chủ cơ sở dữ liệu , nó là một sản phẩm phần mềm có chức năng chính lưu trữ và truy xuất dữ liệu theo yêu cầu của các ứng dụng phần mềm khác - có thể chạy trên cùng một máy tính hoặc trên một máy tính khác qua mạng 

MySQL là hệ quản trị cơ sở dữ liệu tự do nguồn mở phổ biến nhất thế giới và được các nhà phát triển rất ưa chuộng trong quá trình phát triển ứng dụng. Vì MySQL là cơ sở dữ liệu tốc độ cao, ổn định và dễ sử dụng, có tính khả chuyển, hoạt động trên nhiều hệ điều hành cung cấp một hệ thống lớn các hàm tiện ích rất mạnh. Với tốc độ và tính bảo mật cao, MySQL rất thích hợp cho các ứng dụng có truy cập CSDL trên internet. MySQL miễn phí hoàn toàn cho nên bạn có thể tải về MySQL từ trang chủ. Nó có nhiều phiên bản cho các hệ điều hành khác nhau: phiên bản Win32 cho các hệ điều hành dòng Windows, Linux, Mac OS X, Unix, FreeBSD, NetBSD, Novell NetWare, SGI Irix, Solaris, SunOS,...

MySQL là một trong những ví dụ rất cơ bản về Hệ Quản trị Cơ sở dữ liệu quan hệ sử dụng Ngôn ngữ truy vấn có cấu trúc (SQL).

MySQL được sử dụng cho việc bổ trợ PHP, Perl, và nhiều ngôn ngữ khác, nó làm nơi lưu trữ những thông tin trên các trang web viết bằng PHP hay Perl,...



## Chuẩn Lập Trình

Đưa ra các quy ước khi coding với ngôn ngữ lập trình C#, với các quy tắc này giúp tiết kiệm thời gian rất lớn trong tiến trình phát triển phần mềm và cả trong quá trình bảo trì sản phẩm. Giúp sinh viên quen với làm việc theo nhóm.
Tài liệu này chủ yếu hướng dẫn sinh viên với ngôn ngữ lập trình C#, nhưng có rất nhiều quy tắc được sử dụng trong nhiều ngôn ngữ lập trình khác tích hợp trong bộ công cụ Visual Studio .NET.

## Tài Liệu Thiết Kế
[XEM TẠI ĐÂY](https://github.com/goupbaocao4305/trang-web-ban-hang/blob/Th%C3%A1i-Qu%E1%BB%91c-Anh/T%C3%A0i%20Li%E1%BB%87u%20Th%E1%BA%BFt%20K%E1%BA%BF)

## Tài liệu cho nhà phát triển

[XEM TẠI ĐÂY](https://github.com/goupbaocao4305/trang-web-ban-hang/blob/Th%C3%A1i-Qu%E1%BB%91c-Anh/T%C3%A0iLi%E1%BB%87uChoNh%C3%A0Ph%C3%A1tTri%E1%BB%85n.md)

## Tài liệu cho người dùng cuối
 [tại đây](https://github.com/goupbaocao4305/trang-web-ban-hang/blob/Th%C3%A1i-Qu%E1%BB%91c-Anh/Nguoidungcuoi.md)

# Kênh Truyền Thông
fan page: [quản lý web ban hang](https://www.facebook.com/Website-Qu%E1%BA%A3n-l%C3%BD-b%C3%A1n-h%C3%A0ng-Aspnet-186587715212966/?notif_t=page_invite_accepted&notif_id=1500185312002536/)

# Đóng góp ý kiến
[XEM TẠI ĐÂY](https://github.com/goupbaocao4305/trang-web-ban-hang/blob/Th%C3%A1i-Qu%E1%BB%91c-Anh/Donggop)

## Lời cảm ơn


Để hoàn thành tốt đề tài này chúng em xin cảm ơn thầy Mai Cường Thọ. Một lần nữa chúng em xin trân trọng cảm ơn thầy Mai Cường Thọ đã tận tình giúp đỡ, hướng dẫn chúng em trong suốt quá trình thực hiện đề tài.
