//
//  sample.swift
//  GiphyAssessmentTests
//
//  Created by Chandra Sekhar on 12/02/23.
//

import Foundation


let mockString = """
{
  "data": [
    {
      "type": "gif",
      "id": "bSCxU4HkeT7uqQeRjf",
      "url": "https://giphy.com/gifs/phoenixmercury-phoenix-mercury-diana-taurasi-dianataurasi-bSCxU4HkeT7uqQeRjf",
      "slug": "phoenixmercury-phoenix-mercury-diana-taurasi-dianataurasi-bSCxU4HkeT7uqQeRjf",
      "bitly_gif_url": "https://gph.is/g/4Md2X6w",
      "bitly_url": "https://gph.is/g/4Md2X6w",
      "embed_url": "https://giphy.com/embed/bSCxU4HkeT7uqQeRjf",
      "username": "phoenixmercury",
      "source": "",
      "title": "Happy Love It GIF by Phoenix Mercury",
      "rating": "g",
      "content_url": "",
      "source_tld": "",
      "source_post_url": "",
      "is_sticker": 0,
      "import_datetime": "2023-02-08 22:05:04",
      "trending_datetime": "2023-02-10 17:00:11",
      "images": {
        "original": {
          "height": "480",
          "width": "480",
          "size": "3621342",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy.gif&ct=g",
          "mp4_size": "282262",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy.mp4&ct=g",
          "webp_size": "857860",
          "webp": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy.webp?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy.webp&ct=g",
          "frames": "56",
          "hash": "3a39a3330ed66b7f951a7f8cf61db877"
        },
        "downsized": {
          "height": "376",
          "width": "376",
          "size": "1842886",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy-downsized.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy-downsized.gif&ct=g"
        },
        "downsized_large": {
          "height": "480",
          "width": "480",
          "size": "3621342",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy.gif&ct=g"
        },
        "downsized_medium": {
          "height": "480",
          "width": "480",
          "size": "3621342",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy.gif&ct=g"
        },
        "downsized_small": {
          "height": "342",
          "width": "342",
          "mp4_size": "68789",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy-downsized-small.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy-downsized-small.mp4&ct=g"
        },
        "downsized_still": {
          "height": "376",
          "width": "376",
          "size": "34315",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy-downsized_s.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy-downsized_s.gif&ct=g"
        },
        "fixed_height": {
          "height": "200",
          "width": "200",
          "size": "613867",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200.gif&ct=g",
          "mp4_size": "63464",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200.mp4&ct=g",
          "webp_size": "236270",
          "webp": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200.webp?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200.webp&ct=g"
        },
        "fixed_height_downsampled": {
          "height": "200",
          "width": "200",
          "size": "86354",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200_d.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200_d.gif&ct=g",
          "webp_size": "57722",
          "webp": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200_d.webp?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200_d.webp&ct=g"
        },
        "fixed_height_small": {
          "height": "100",
          "width": "100",
          "size": "211082",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/100.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=100.gif&ct=g",
          "mp4_size": "20648",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/100.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=100.mp4&ct=g",
          "webp_size": "89288",
          "webp": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/100.webp?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=100.webp&ct=g"
        },
        "fixed_height_small_still": {
          "height": "100",
          "width": "100",
          "size": "5197",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/100_s.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=100_s.gif&ct=g"
        },
        "fixed_height_still": {
          "height": "200",
          "width": "200",
          "size": "14100",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200_s.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200_s.gif&ct=g"
        },
        "fixed_width": {
          "height": "200",
          "width": "200",
          "size": "613867",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200w.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200w.gif&ct=g",
          "mp4_size": "63464",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200w.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200w.mp4&ct=g",
          "webp_size": "236270",
          "webp": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200w.webp?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200w.webp&ct=g"
        },
        "fixed_width_downsampled": {
          "height": "200",
          "width": "200",
          "size": "86354",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200w_d.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200w_d.gif&ct=g",
          "webp_size": "57722",
          "webp": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200w_d.webp?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200w_d.webp&ct=g"
        },
        "fixed_width_small": {
          "height": "100",
          "width": "100",
          "size": "211082",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/100w.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=100w.gif&ct=g",
          "mp4_size": "20648",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/100w.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=100w.mp4&ct=g",
          "webp_size": "89288",
          "webp": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/100w.webp?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=100w.webp&ct=g"
        },
        "fixed_width_small_still": {
          "height": "100",
          "width": "100",
          "size": "5197",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/100w_s.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=100w_s.gif&ct=g"
        },
        "fixed_width_still": {
          "height": "200",
          "width": "200",
          "size": "14100",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/200w_s.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=200w_s.gif&ct=g"
        },
        "looping": {
          "mp4_size": "2512222",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy-loop.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy-loop.mp4&ct=g"
        },
        "original_still": {
          "height": "480",
          "width": "480",
          "size": "109174",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy_s.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy_s.gif&ct=g"
        },
        "original_mp4": {
          "height": "480",
          "width": "480",
          "mp4_size": "282262",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy.mp4&ct=g"
        },
        "preview": {
          "height": "314",
          "width": "314",
          "mp4_size": "30103",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy-preview.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy-preview.mp4&ct=g"
        },
        "preview_gif": {
          "height": "88",
          "width": "88",
          "size": "48815",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy-preview.gif?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy-preview.gif&ct=g"
        },
        "preview_webp": {
          "height": "160",
          "width": "160",
          "size": "39754",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy-preview.webp?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy-preview.webp&ct=g"
        },
        "hd": {
          "height": "1080",
          "width": "1080",
          "mp4_size": "3612278",
          "mp4": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/giphy-hd.mp4?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=giphy-hd.mp4&ct=g"
        },
        "480w_still": {
          "height": "480",
          "width": "480",
          "size": "3621342",
          "url": "https://media4.giphy.com/media/bSCxU4HkeT7uqQeRjf/480w_s.jpg?cid=96d01f2epdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97&rid=480w_s.jpg&ct=g"
        }
      },
      "user": {
        "avatar_url": "https://media4.giphy.com/avatars/phoenixmercury/ThIyF7jf0juK.png",
        "banner_image": "https://media4.giphy.com/channel_assets/phoenixmercury/d2pUSro1B07T.jpg",
        "banner_url": "https://media4.giphy.com/channel_assets/phoenixmercury/d2pUSro1B07T.jpg",
        "profile_url": "https://giphy.com/phoenixmercury/",
        "username": "phoenixmercury",
        "display_name": "Phoenix Mercury",
        "description": "",
        "instagram_url": "https://instagram.com/phoenixmercury",
        "website_url": "https://mercury.wnba.com",
        "is_verified": true
      },
      "analytics_response_payload": "e=Z2lmX2lkPWJTQ3hVNEhrZVQ3dXFRZVJqZiZldmVudF90eXBlPUdJRl9UUkVORElORyZjaWQ9OTZkMDFmMmVwZGsxNGlrMTF3OXBwZGpjMGlmdzdibjlmNHF3MGJibGtyeHZ5dTk3JmN0PWc",
      "analytics": {
        "onload": {
          "url": "https://giphy-analytics.giphy.com/v2/pingback_simple?analytics_response_payload=e%3DZ2lmX2lkPWJTQ3hVNEhrZVQ3dXFRZVJqZiZldmVudF90eXBlPUdJRl9UUkVORElORyZjaWQ9OTZkMDFmMmVwZGsxNGlrMTF3OXBwZGpjMGlmdzdibjlmNHF3MGJibGtyeHZ5dTk3JmN0PWc&action_type=SEEN"
        },
        "onclick": {
          "url": "https://giphy-analytics.giphy.com/v2/pingback_simple?analytics_response_payload=e%3DZ2lmX2lkPWJTQ3hVNEhrZVQ3dXFRZVJqZiZldmVudF90eXBlPUdJRl9UUkVORElORyZjaWQ9OTZkMDFmMmVwZGsxNGlrMTF3OXBwZGpjMGlmdzdibjlmNHF3MGJibGtyeHZ5dTk3JmN0PWc&action_type=CLICK"
        },
        "onsent": {
          "url": "https://giphy-analytics.giphy.com/v2/pingback_simple?analytics_response_payload=e%3DZ2lmX2lkPWJTQ3hVNEhrZVQ3dXFRZVJqZiZldmVudF90eXBlPUdJRl9UUkVORElORyZjaWQ9OTZkMDFmMmVwZGsxNGlrMTF3OXBwZGpjMGlmdzdibjlmNHF3MGJibGtyeHZ5dTk3JmN0PWc&action_type=SENT"
        }
      }
    }
  ],
  "pagination": {
    "total_count": 3255,
    "count": 1,
    "offset": 0
  },
  "meta": {
    "status": 200,
    "msg": "OK",
    "response_id": "pdk14ik11w9ppdjc0ifw7bn9f4qw0bblkrxvyu97"
  }
}
"""
