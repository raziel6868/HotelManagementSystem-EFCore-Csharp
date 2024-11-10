﻿using System;
using System.Collections.Generic;

namespace DataAccessLayer.Models;

public partial class RoomInformation
{
    public int RoomId { get; set; }

    public string? RoomNumber { get; set; }

    public string? RoomDetailDescription { get; set; }

    public int? RoomMaxCapacity { get; set; }

    public int? RoomTypeId { get; set; }

    public string? RoomStatus { get; set; }

    public decimal? RoomPricePerDay { get; set; }

    public virtual ICollection<BookingDetail> BookingDetails { get; set; } = new List<BookingDetail>();

    public virtual RoomType? RoomType { get; set; }
}