const express = require('express')
const router = express.Router()
const verifyToken = require('../middleware/auth')
const Post = require('../models/Post')

//@route Get api/post
//@desc Get posts
//@access Private

router.get('/', verifyToken, async(req, res) => {
    try {
        const posts = await Post.find({ user: req.userId }).populate('user', ['username'])
        res.json({ success: true, posts })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: "Interval server error" })
    }
})

//@route POST api/post
//@desc Create post
//@access Private

router.post('/', verifyToken, async(req, res) => {
    const { title, description, url, status } = req.body

    //simple validation
    if (!title)
        return res.status(400).json({ success: false, message: 'Title is require' })

    try {
        const newPost = new Post({
            title,
            description,
            url: (url.startsWith('https://')) ? url : `https://${url}`,
            status: status || 'To LEARN',
            user: req.userId
        })

        await newPost.save()

        res.json({ success: true, message: 'Happy learning!', post: newPost })

    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: 'Internal server error!' })
    }
})

//@route POST api/post
//@desc Update post
//@access Private

router.put('/:id', verifyToken, async(req, res) => {
    const { title, description, url, status } = req.body

    //simple validation
    if (!title)
        return res.status(400).json({ success: false, message: 'Title is require' })

    try {
        let updatedPost = {
            title,
            description: description || '',
            url: ((url.startsWith('https://')) ? url : `https://${url}`) || '',
            status: status || 'TO LEARN'
        }

        const postUpdateCondition = { _id: req.params.id, user: req.userId }
        updatedPost = await Post.findOneAndUpdate(postUpdateCondition, updatedPost, { new: true })
            // user not authorised to update post 

        if (!updatedPost)
            return res.status(401).json({ success: false, message: 'Post not found or user not authorised' })

        res.json({ success: true, message: 'Excellent progress!' })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: 'Internal server error!' })
    }
})

//@route DELETE api/post
//@desc Delete post
//@access Private

router.delete('/:id', verifyToken, async(req, res) => {
    try {
        const postDeleteCondition = { _id: req.params.id, user: req.userId }
        const deletePost = await Post.findOneAndDelete(postDeleteCondition)
            // user not authorised to update post 

        if (!deletePost)
            return res.status(401).json({ success: false, message: 'Post not found or user not authorised' })
        res.json({ success: true, post: deletePost })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: 'Internal server error!' })
    }
})

module.exports = router