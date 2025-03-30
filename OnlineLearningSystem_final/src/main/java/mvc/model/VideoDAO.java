package mvc.model;

import java.sql.*;
import java.util.ArrayList;
import mvc.database.DBConnection;

public class VideoDAO {
    private static VideoDAO instance = new VideoDAO();

    public static VideoDAO getInstance() {
        return instance;
    }

    public ArrayList<VideoDTO> getVideosBySubject(int subjectId)
    		throws SQLException, ClassNotFoundException {
        ArrayList<VideoDTO> videoList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT video_id, video_title, video_path FROM SubjectVideos WHERE subject_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, subjectId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                VideoDTO video = new VideoDTO();
                video.setVideoId(rs.getInt("video_id"));
                video.setVideoTitle(rs.getString("video_title"));
                video.setVideoPath(rs.getString("video_path"));
                videoList.add(video);
            }
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
        //System.out.println(videoList);
        return videoList;
    }
    
}
