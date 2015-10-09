require 'segment/analytics'

Analytics = Segment::Analytics.new({
    write_key: 'ptzSTkGHwPspBxT5PgLXL8gNYVTmmBly',
    on_error: Proc.new { |status, msg| print msg }
})